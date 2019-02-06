@javascript

Feature: Coach creates and starts videocall for session

    As a coach
    In order to have a session
    I would like to be able to create and start a video call for the session

    Background:
        Given the following price table exists
            | pricePoint | trainees |
            | low        | 4        |
            | medium     | 4        |
            | high       | 4        |

        And the following user exists
            | email             | password | password_confirmation | first_name  | last_name | role    |
            | coach@email.com   | password | password              | Coach-Jon   | Doe       | coach   |
            | trainee@email.com | password | password              | Trainee-Jon | Doe       | trainee |

        And the following sessions exist
            | title    | startDate           | end_date            | status |
            | Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | booked |

        And I am logged in as 'coach@email.com'
        And I visit the site
        And show me the page

    Scenario: Videocall gets added to session
        Given I click 'Start'
        Then I should be on the videocall page
        And I should see 'My feed'
        And I should see 'Remote feeds'
        And I should see 'Canvas feed'
