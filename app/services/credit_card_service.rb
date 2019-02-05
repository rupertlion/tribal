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
			amount: 100 *100,
			currency: 'SEK',
			description: "#{current_user.first_name} #{current_user.last_name} purchased the session: #{session.title}"
		)
	end

	def self.charge_paid(current_user)
		@transaction = Transaction.new(amount: 100, user_id: current_user.id)
				@transaction.save
	end

	def self.get_token(params)
		Rails.env.test? ? generate_test_token : params['stripeToken']
	end

	def self.generate_test_token
		StripeMock.create_test_helper.generate_card_token
	end

end
