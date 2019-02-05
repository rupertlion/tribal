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

	def self.capture_charge(transaction_id)
		charge = Stripe::Charge.retrieve(transaction_id)
		charge.capture
	end

	def self.charge_paid(current_user)
		charge = Stripe::Charge.retrieve('ch_OxuUya3GiP11VP5KkWRt')
		charge.capture
	end

	def self.get_token(params)
		Rails.env.test? ? generate_test_token : params['stripeToken']
	end

	def self.generate_test_token
		StripeMock.create_test_helper.generate_card_token
	end

end
