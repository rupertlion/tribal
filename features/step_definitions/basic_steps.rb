Given("I visit the site") do
	visit root_path
end

Given("the following sessions exist") do |table|
	table.hashes.each do |session|
		create(:session, session)
	end
end

Given('the following user exists') do |table|
	table.hashes.each do |user|
		create(:user, user)
	end
end

When("I fill in {string} with {string}") do |element, value|
	fill_in element, with: value
end

When("I click {string}") do |element|
	click_on element
end

Given("I am logged in as {string}") do |email|
	@user = User.find_by email: email
	login_as @user, scope: :user
	visit root_path
end


