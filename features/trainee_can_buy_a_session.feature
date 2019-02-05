@javascript @stripe
Feature: User can buy a subscription

	As a user
	In order to get access to the best articles
	I would like to be able to buy a subscription

	Background:
		Given the following user exists
			| first_name | last_name | email         | password |
			| John       | Doe       | john@mail.com | password |

		And the following sessions exist
			| title     | start_date          | end_date            | status    |
			| Crossfit  | 2020-02-01 15:00:00 | 2020-02-01 15:30:00 | available |

	Scenario: Trainee can successfully buy a subscription
		And I am logged in as 'john@mail.com'
		And I click 'Book'
		And I click 'Buy Session'
		And I fill in the payment form
		And I click 'Pay'
		Then I wait 2 seconds
		And I should see 'You just purchased a session!'
		And the card is not yet charged
		And the date is 2020-02-01 15:00:00
		And the card is charged
