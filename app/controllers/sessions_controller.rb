class SessionsController < ApplicationController
	layout "main"

	def show
		if user_signed_in?
			user = current_user
		end
		session = Session.find(params[:id])
		@session_props = {session: session, user: user}
	end
end
