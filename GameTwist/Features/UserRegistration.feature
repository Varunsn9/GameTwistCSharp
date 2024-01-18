Feature: UserRegistration

Validation of User Registration

@UserRegistration @NotAutomatable
Scenario: Users can successfully register for an account with valid information
	Given User navigating registration page <"https://www.gametwist.com/en/registration/">
	When  the user provides valid registration information
	And agrees to the terms and conditions
    And submits the registration form
    Then the user receives a verification email

     When the user clicks on the activation link in the email
    Then the user account is successfully activated

     When the user logs in with the registered credentials
    Then the user is redirected to the home page
    And receives a welcome message or notification
    
@NotAutomatable
 Scenario: Users must verify their email to activate the account

    Given the user has registered with valid information
    And the user gets the verification link
    When the user clicks on the verification link
    Then the user account is successfully activated
    And the user can log in with Nickname<""> and password <"">

@NotAutomatable
Scenario: Users must adhere to password strength requirements

    Given the user is on the registration page <"https://www.gametwist.com/en/registration/">
    When the user provides a weak password <"1213abc">
    Then the system displays an error message about password strength <"Your password must be at least 10 characters long."> <"Your password must contain at least one letter, one number or a special character.">
    And the user cannot proceed with registration

    When the user provides a strong password<"1234abc!@#">
    And submits the registration form
    Then the user receives a verification email
    And can successfully activate the account

@Automatable
Scenario: Users cannot register with an already registered email

    Given there is an existing user with a specific email address <"feydicirzo@gufum.com">
    When the user attempts to register with the same email address <"feydicirzo@gufum.com">
    Then the system displays an <"The e-mail address you entered is already in use."> error message
    And the user cannot proceed with registration using the duplicate email

@Automatable
Scenario:Users cannot register with invalid information

    Given the user is on the registration page <"https://www.gametwist.com/en/registration/">
    When the user provides invalid registration Email <"emailWIthouthAttherate">
    Then  the system displays <"Please enter a valid e-mail address."> error message

    When the user provides invalid registration NickName <aa>
    Then  the system displays <"Your nickname must be between 3 and 13 characters long."> error message
    
    When the user provides invalid registration Password <"123asd!@#">
    Then  the system displays <"Your password must be at least 10 characters long."> <"Your password must contain at least one letter, one number or a special character."> error message
    
     When the user regstartion without agreeing terms and conditions 
    Then  the system displays <"You must agree to our General Terms & Conditions to continue."> error message
   
    When the user not providing date of birth 
    And submits the registration form 
    Then  the system displays <"Please select day"> <"Please select month"> <"Please select year"> error messages
   
    When the user not Checking of captcha 
    And submits the registration form 
    Then  the system displays <"The security check is a required field. Please enter the code."> error messages
    And the user cannot proceed with registration
    
