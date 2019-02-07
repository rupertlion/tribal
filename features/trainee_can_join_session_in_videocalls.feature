@javascript

Feature: Trainee can join session in Videocalls

    As a trainee
    In order to join sessions
    I would like to be able to join a videocall hosted on Tribal

    Background: 

    Given the following user exists
            | email             | password | password_confirmation | first_name  | last_name | role    |
            | coach@email.com   | password | password              | Coach-Jon   | Doe       | coach   |
            | trainee@email.com | password | password              | Trainee-Jon | Doe       | trainee |

        And the following sessions exist
            | title    | start_date          | end_date            | status |
            | Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | booked |

        And I am logged in as 'trainee@email.com'
        And I visit the site

    Scenario: Trainee can join session in Videocalls
        Given I click 'Join'
        And I should see 'My feed'
        And I should see 'Remote feeds'
        And I should see 'Canvas feed'
    
    Scenario: Trainee can not join a unstarted session
        Given I have booked the session
        Then I should see "Has not started yet"
