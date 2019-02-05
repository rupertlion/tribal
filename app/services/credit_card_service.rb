require 'stripe'

module CreditCardService

	def self.create_stripe_customer(current_user,params)
		Stripe::Customer.create(
			email: current_user.email,
			source: get_token(params),
			description: [current_user.first_name, current_user.last_name].join('')
		)
	end

	def self.create_charge (customer,current_user,session)
		Stripe::Charge.create(
			customer: customer.id,
			amount: 100 * 100,
			currency: 'SEK',
			capture: false,
			description: "#{current_user.first_name} #{current_user.last_name}
										purchased the session: #{session.title}"
		)
	end

	# def self.changeStuff(transaction_id)
	# 	tr = Transaction.find_by_id(transaction_id)
	# 	tr.update_attribute(:payment_status, true)
	# end
	# handle_asynchronously :changeStuff

	def self.capture_charge(transaction)
		charge = Stripe::Charge.retrieve(transaction.stripe_id)
		charge.capture
	end

	def self.get_token(params)
		Rails.env.test? ? generate_test_token : params['stripeToken']
	end

	def self.generate_test_token
		StripeMock.create_test_helper.generate_card_token
	end

end
