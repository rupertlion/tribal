@javascript
Feature: User can sign in using Facebook

	As a user
	In order to gain access to Tribal's features
	I would like to be able to sign in using Facebook


	Scenario: Visitor clicks on 'Login with Facebook' and gets authenticated
		Given I visit the site
		And I click "Login with Facebook"
		# Then I should be redirected to index page
		And I should see "Successfully authenticated from Facebook account"

	Scenario: Facebook authentication fails
		Given the facebook authentication is not granted
		And I visit the site
		And I click "Login with Facebook"
		Then I should be redirected to index page
		And I should see "Could not authenticate you!"
