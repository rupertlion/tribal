class TransactionsController < ApplicationController

	def new
		@session = Session.find_by_id(params[:sessionId])
	end
	def create
			session = Session.find(params[:session_id])
			@user = User.find_by_id(current_user.id)
			customer = Stripe::Customer.create(
					email: current_user.email,
					source: get_token(params),
					description: [current_user.first_name, current_user.last_name].join('')
			)
			charge = Stripe::Charge.create(
					customer: customer.id,
					amount: 100 *100,
					currency: 'SEK',
					description: "#{current_user.first_name} #{current_user.last_name} purchased the session: #{session.title}"
			)
			if charge[:paid]
					@transaction = Transaction.new(amount: 100, user_id: current_user.id)
					@transaction.save
					redirect_to session_path(session.id),
					notice: "You just purchased a session!"
			else
					redirect_to session_path(session.id), notice: "Charge declined!"
			end
	end
	private
	def get_token(params)
			Rails.env.test? ? generate_test_token : params['stripeToken']
	end
	def generate_test_token
			StripeMock.create_test_helper.generate_card_token
	end
end