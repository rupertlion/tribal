Given("I visit the site") do
	visit root_path
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

Given("I fill in {string} field with {string}") do |element, value|
	fill_in element, with: value
end

Given("show me the page") do
	save_and_open_page
end

When("I select {string} from {string}") do |option, selection|
	select option, from: selection
end

When("I wait 2 seconds") do
	sleep 15
end

Given("I fill in {string} with Mar, 2019") do |field|
    element = page.find_by_id(field)
    element.send_keys :up
    element.send_keys :tab
	element.send_keys :up
	element.send_keys :up
	element.send_keys :up
	element.send_keys :tab
	element.send_keys :up
	element.send_keys :tab
	element.send_keys :up
	element.send_keys :tab
	element.send_keys :up
end