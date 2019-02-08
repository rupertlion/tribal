@javascript @stripe
Feature: User can buy a subscription

	As a user
	In order to get access to the best articles
	I would like to be able to buy a subscription

	Background:
		Given the following user exists
			| first_name | last_name | email          | password | role    |
			| John       | Doe       | john@mail.com  | password | trainee |
			| John2      | Doe       | john2@mail.com | password | trainee |
			| John3      | Doe       | john3@mail.com | password | trainee |
			| John4      | Doe       | john4@mail.com | password | trainee |

		And the following price table exists
			| price_point | trainee_1 | trainee_3 | trainee_4 | trainee_5 | trainee_6 |
			| low         | 60        | 25        | 20        | 15        | 10        |

		And the following sessions exist
			| title    | start_date          | end_date            | status    | price_table_id |
			| Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | available | 1              |
		And the time is 2019 1 30 10:00:00

	Scenario: Trainee can successfully buy a subscription
		And I am logged in as 'john@mail.com'
		And I click 'Book'
		And I click 'Buy Session'
		And I fill in the payment form
		And I click 'Pay'
		Then I wait 2 seconds
		And I should see 'You just purchased a session!'
		And the payment status is false
		And the amount is 60
		And three more trainees attend
		And the time is 2019 2 1 15:01:00
		And the job runs
		And the payment status is true
		And the amount is 20
