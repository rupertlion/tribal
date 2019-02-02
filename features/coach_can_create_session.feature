Feature: Coach can create session

    As a coach
    In order to utilize my spare time
    I would like to be able to make sessions on Tribal

    Background:
        Given the following user exists
            | email           | password | password_confirmation | first_name | last_name |
            | coach@email.com | password | password              | Coach-Jon  | Doe       |
        And I am on the create session page

    Scenario: Coach can create session
        Given I fill in 'Title' field with 'Spinning'
        And I fill in 'date' with the date '2019-02-20'
        And I fill in 'time' field with '18:00'
        And I select 'low' from 'session[price_table_id]'
        And I click on 'Create Session'
        And I should see 'Spinning'
        Then I should see 'Session successfully created'
