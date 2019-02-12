@javascript
Feature: Trainee can see name of session coach

	As a trainee,
	In order to help choose a session to attend,
	I would like to see the coach's name next to each session in the list.

	Background:
		Given the following user exists
			| email           | password | password_confirmation | first_name | last_name | role    |
			| real@email.com  | password | password              | Jon        | Doe       | trainee |
			| dan@email.com   | password | password              | Dan        | Doe       | coach   |
			| jack@email.com  | password | password              | Jack       | Doe       | coach   |
			| hanna@email.com | password | password              | Hanna      | Doe       | coach   |

		And the following sessions exist
			| title     | start_date          | end_date            | status    | coach           |
			| Crossfit  | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | scheduled | dan@email.com   |
			| Yoga      | 2019-02-01 19:00:00 | 2019-02-01 19:30:00 | confirmed | jack@email.com  |
			| Body Pump | 2019-02-01 21:00:00 | 2019-02-01 21:30:00 | full      | hanna@email.com |

	Scenario: Trainee can view all sessions on the Home Page
		Given I am logged in as "real@email.com"
		And I should see 'CROSSFIT'
		And I should see 'Dan'
		And I should see '01/02/2019, 15:00:00'
		And I should see 'YOGA'
		And I should see 'Jack'
		And I should see '01/02/2019, 19:00:00'
		And I should see 'BODY PUMP'
		And I should see 'Hanna'
		And I should see '01/02/2019, 21:00:00'
