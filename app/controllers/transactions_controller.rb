class TransactionsController < ApplicationController

	def new
		@session = Session.find_by_id(params[:sessionId])
	end

	def create
		session = Session.find(params[:session_id])
		@user = User.find_by_id(current_user.id)
		customer = CreditCardService.create_stripe_customer(current_user,params)
		charge = CreditCardService.create_charge(customer,current_user,session)
		transaction = Transaction.create(
															amount: charge.amount/100,
															stripe_id: charge.id,
															payment_status: false,
															user_id: current_user.id,
															session_id: session.id)
		price = Price.new
		delayed_payment = price.delay(run_at: 1.minutes.from_now).changeStuff(transaction.id)
		if charge
				redirect_to session_path(session.id), notice: "You just purchased a session!"
		else
				redirect_to session_path(session.id), notice: "Charge declined!"
		end
	end
end
