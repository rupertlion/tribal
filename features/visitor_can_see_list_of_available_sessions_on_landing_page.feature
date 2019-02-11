@javascript
Feature: Visitor can see all available sessions on landing page

    As a visitor,
    In order to see all the exciting sessions available to me,
    I would like to see all available sessions before logging in.

	Background:
		Given the following sessions exist
			| title     | start_date          | end_date            | status    |
			| Crossfit  | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | scheduled |
			| Yoga      | 2019-02-01 19:00:00 | 2019-02-01 19:30:00 | confirmed |
			| Body Pump | 2019-02-01 21:00:00 | 2019-02-01 21:30:00 | full      |

	Scenario: Visitor can view all sessions on the Landing Page
		Given I visit the site
		Then I should see 'LOGIN' 
        And I should see 'REGISTER'
		And I should see 'Available Sessions' 
        And I should see 'CROSSFIT'
		And I should see '01/02/2019, 15:00:00'
		And I should see 'YOGA'
		And I should see '01/02/2019, 19:00:00'
		And I should not see 'BODY PUMP'
		And I should not see '01/02/2019, 21:00:00'