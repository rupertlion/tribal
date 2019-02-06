Feature: Coach creates and starts videocall for session

    As a coach
    In order to have a session
    I would like to be able to create and start a video call for the session

    Background:
        Given the following user exists
            | first_name | last_name | email         | password | role  |
            | John       | Doe       | john@mail.com | password | coach |

        And the following sessions exist
            | title    | startDate           | end_date            | status |
            | Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | booked |

        And I visit the site

    Scenario: Videocall gets added to session
        Given I click 'Start'
        Then I should be on the videocall page
        And I should see 'My feed'
        And I should see 'Remote feeds'
        And I should see 'Canvas feed'
