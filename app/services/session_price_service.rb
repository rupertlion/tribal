class SessionPrice
	def self.get_price(session)
		count = session.users.trainee.count
		price_row = PriceTable.find_by_id(session.price_point)
		trainee_count = "trainee_#{count}"
		price = price_row[trainee_count]
		return price
	end
end
