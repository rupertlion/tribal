Then("I should see {string}") do |content|
	expect(page).to have_content content
end

Then("I should see {string} in {string}") do |session, status|
	within("#{status}") do 
		expect(page).to have_content session
	end
end

Then("I should not see {string}") do |content|
    expect(page).to have_no_content content
end

Then("I should be on sessions page") do
	expect(current_path).to eq sessions_path
end
