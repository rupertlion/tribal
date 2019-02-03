class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
			@user = User.from_omniauth(request.env['omniauth.auth'], request.env['omniauth.params'])
			if @user.persisted?
					sign_in @user, event: :authentication
					redirect_to root_path
					set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
			else
					session['devise.facebook_date'] = request.env['omniauth.auth']
					redirect_to root_path
			end
	end

	def failure
    redirect_to root_path, notice: 'Could not authenticate you!'
	end

end
