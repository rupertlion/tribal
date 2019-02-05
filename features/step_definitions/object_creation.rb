Given("the following sessions exist") do |table|
	table.hashes.each do |session|
		create(:session, session)
	end
end

Given("the following price table exists") do |table|
	table.hashes.each do |price_table|
		create(:price_table, price_table)
	end
end

Given('the following user exists') do |table|
	table.hashes.each do |user|
		create(:user, user)
	end
end