@javascript
Feature: Coach can create session

    As a coach
    In order to utilize my spare time
    I would like to be able to make sessions on Tribal

    Background:
        Given the following price table exists
            | price_point | trainees |
            | low         | 4        |
            | medium      | 4        |
            | high        | 4        |

        And the following user exists
            | email           | password | password_confirmation | first_name | last_name |
            | coach@email.com | password | password              | Coach-Jon  | Doe       |
        And I visit the site
        And I am logged in as 'coach@email.com'
        And I click 'Add Session'

    Scenario: Coach can create session
        Given I fill in 'session[title]' field with 'Spinning'
        And I fill in 'session[start_date]' field with '2019-02-20 20:00'
        And I fill in 'session[price_point]' field with '1'
        And I click 'Add Session'
        And I wait 2 seconds
        Then I should see 'SPINNING'

    Scenario: Coach can not create session
        Given I click 'Add Session'
        Then I should see 'Every field needs to be filled in!'
