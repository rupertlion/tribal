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
        Given I select '2019' from 'start_date[year]'
        And I select 'May' from 'start_date[month]'
        And I select '17' from 'start_date[day]'
        And I fill in 'Title' field with 'Crossfit'
        And I fill in 'Description' field with 'Workout'
        And I click on 'Create Session'
        And I should see 'Workout'
        Then I should see 'Session successfully created'
