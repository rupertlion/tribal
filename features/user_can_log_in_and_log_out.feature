Feature: User can log in and out
    As a Visitor
    In order to use the site functionality
    I want sign up and log in

    Background:
        Given the following user exists
            | email          | password | password_confirmation | first_name | last_name | role |
            | real@email.com | password | password              | Jon        | Doe       | 0    |
        And I visit the landing page
        And I click 'Login'

    Scenario: If user fills in the login form correctly he can log in
        When I fill in 'Email' field with 'real@email.com'
        And I fill in 'Password' field with 'password'
        And I click 'Log in'
        Then I should see 'Hello, Jon!'

    Scenario: If user fills in the login form incorrectly he will see an error message
        When I click 'Log in'
        Then I should see 'Invalid Email or password.'

    Scenario: User can log out when logged in
        Given I am logged in as 'real@email.com'
        When I click 'Logout'
        Then I should not see 'Hello, Jon!'