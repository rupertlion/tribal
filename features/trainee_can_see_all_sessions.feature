@javascript
Feature: Trainee can see all sessions

	As a Trainee
	In order to be able to choose the session I want
	I would like to see all the available sessions on the home page

	Background:
		Given the following user exists
			| email          | password | password_confirmation | first_name | last_name | role |
			| real@email.com | password | password              | Jon        | Doe       | 0    |
		And the following sessions exist
			| title     | start_date          | end_date            | status    |
			| Crossfit  | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | available |
			| Yoga      | 2019-02-01 19:00:00 | 2019-02-01 19:30:00 | booked    |
			| Body Pump | 2019-02-01 21:00:00 | 2019-02-01 21:30:00 | full      |

	Scenario: Trainee can view all sessions on the Home Page
		Given I am logged in as "real@email.com"
		Then I should see 'CROSSFIT' in 'available'
		And I should see '01/02/2019, 15:00:00' in 'available'
		And I should see 'YOGA' in 'booked'
		And I should see '01/02/2019, 19:00:00' in 'booked'
		And I should see 'BODY PUMP' in 'full'
		And I should see '01/02/2019, 21:00:00' in 'full'
