@javascript @stripe
Feature: User can buy a subscription

	As a user
	In order to get access to the best articles
	I would like to be able to buy a subscription

	Background:
		Given the following user exists
			| first_name | last_name | email         | password |
			| John       | Doe       | john@mail.com | password |

	Scenario: Trainee can successfully buy a subscription
		And I am logged in as 'john@mail.com'
		And I click 'Buy session'
		And I fill in the payment form
		And I click 'Pay'
		Then I wait 2 seconds
		And I should not see 'Buy session'
