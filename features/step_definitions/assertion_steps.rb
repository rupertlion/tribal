Then("I should see {string}") do |content|
	expect(page).to have_content content
end

Then("I should see {string} in {string}") do |session, status|
	within("##{status}") do
		expect(page).to have_content session
	end
end

Then("I should not see {string}") do |content|
    expect(page).to have_no_content content
end

Then("the payment status is true") do
	transaction = Transaction.last
	expect(transaction.payment_status).to equal true
end

Then("the payment status is false") do
	transaction = Transaction.last
	expect(transaction.payment_status).to equal false
end
