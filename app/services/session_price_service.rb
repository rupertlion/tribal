class SessionPriceService
	def self.get_price(session)
		count = session.users.trainee.count
		price_row = PriceTable.find_by_id(session.price_table_id)
		SessionPriceService.calculate_price(count, price_row)
end

private

def self.calculate_price(count, price_row)
	case count
		when 1
			trainee_count = 'trainee_1'
		when 2
			trainee_count = 'trainee_1'
		when 3
			trainee_count = 'trainee_3'
		when 4
			trainee_count = 'trainee_4'
		when 5
			trainee_count = 'trainee_5'
		when 6
			trainee_count = 'trainee_6'
		end
		price_row[trainee_count]
	end
end
