@javascript
Feature: User can register and login using Facebook

	As a user
	In order to gain access to Tribal's features
	I would like to be able to register and login using Facebook

	Background:
		Given I visit the site

	Scenario: Visitor can register and login with FaceBook and gets authenticated
		And I click "Register"
		And I click "Trainee"
		And I click "Register with Facebook"
		And I should see "Hello, John!"
		And I click "Logout"
		And I should not see "Hello, John!"
		And I click "Login"
		And I click "Login with Facebook"
		And I should see "Hello, John!"

	Scenario: Facebook authentication fails
		Given the facebook authentication is not granted
		And I visit the site
		And I click "Login with Facebook"
		Then I should be redirected to index page
		And I should see "Could not authenticate you!"
