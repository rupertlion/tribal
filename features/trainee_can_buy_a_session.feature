@javascript @stripe
Feature: User can buy a subscription

	As a user
	In order to get access to the best articles
	I would like to be able to buy a subscription

	Background:
		Given the following user exists
			| first_name | last_name | email         | password | role    |
			| John       | Doe       | john@mail.com | password | trainee |

		And the following sessions exist
			| title    | start_date          | end_date            | status    |
			| Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | available |
		And the time is 2019 1 30 10:00:00

	Scenario: Trainee can successfully buy a subscription
		And I am logged in as 'john@mail.com'
		Then show me the page
		And I click 'Book'
		And I click 'Buy Session'
		And I fill in the payment form
		And I click 'Pay'
		Then I wait 2 seconds
		And I should see 'You just purchased a session!'
		And the payment status is false
		And the time is 2019 2 1 15:01:00
		And the job runs
		And the payment status is true
