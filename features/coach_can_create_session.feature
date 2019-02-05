@javascript
Feature: Coach can create session

    As a coach
    In order to utilize my spare time
    I would like to be able to make sessions on Tribal

    Background:
        Given the following price table exists
            | pricePoint | trainees |
            | low         | 4        |
            | medium      | 4        |
            | high        | 4        |

        And the following user exists
            | email             | password | password_confirmation | first_name       | last_name |
            | coach@email.com   | password | password              | Coach-Jon        | Doe       |
            | trainee@email.com | password | password              | CoTraineeach-Jon | Doe       |

        And I visit the site


    Scenario: Coach can create session
        Given I am logged in as 'coach@email.com'
        And I click 'Add Session'
        Then I fill in 'session[title]' field with 'Spinning'
        And I fill in 'session[pricePoint]' field with '1'
        And I set the date and time
        And I click 'Add Session'
        Then I should see 'SPINNING'

    Scenario: Coach can not create session
        Given I am logged in as 'coach@email.com'
        And I click 'Add Session'
        And I click 'Add Session'
        Then I should see 'Every field needs to be filled in!'

    Scenario: Trainee can not create session
        Given I am logged in as 'trainee@email.com'
        And I should not see 'Add Session'

