@javascript
Feature: User can sign up
	As a User
	In order to register
	I would like to be able to sign up

	Background:
		Given the following user exists
			| first_name | last_name | email         | password | password_confirmation |
			| Hanna      | Nyman     | hanna@mail.se | password | password              |
		And I visit the site
		And I click "Sign up"
		Then I should see 'I am a'
		Then I click 'Trainee'

	Scenario: When I fill in the sign up form, I can sign up [Happy Path]
		When I fill in 'first_name' with 'John'
		And I fill in 'last_name' with 'Doe'
		And I fill in 'email' with 'johndoe@hotmail.com'
		And I fill in 'password' with 'password'
		And I fill in 'password_confirmation' with 'password'
		And I click 'Submit'
		Then I should see 'Hello, John!'

	Scenario: When I don't fill in the sign up form I get error messages
		When I click 'Submit'
		Then I should see "email can't be blank"
		And I should see "password can't be blank"
		And I should see "first name can't be blank"
		And I should see "last name can't be blank"

	Scenario: When password and password_confirmation doesn't match I get error message
		When I fill in 'password' with 'password'
		And I fill in 'password_confirmation' with 'pasword'
		And I click 'Submit'
		Then I should see "password confirmation doesn't match Password"

	Scenario: When email is taken I get error message
		When I fill in 'email' with 'hanna@mail.se'
		And I fill in 'first_name' with 'John'
		And I fill in 'last_name' with 'Doe'
		And I fill in 'password' with 'password'
		And I fill in 'password_confirmation' with 'password'
		And I click 'Submit'
		Then I should see "email has already been taken"
