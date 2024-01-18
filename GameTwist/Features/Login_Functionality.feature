Feature: Login_Functionality

Validation of Login
@Automatable
 Scenario: Users can successfully log in with valid credentials

    Given the user is on the login page <"https://www.gametwist.com/en/">
    When the user provides valid login credentials <"feydicirzo">  <"1234abc!@#">
    And clicks on the login button
    Then the user is redirected to the home page

@Automatable
Scenario: Users cannot log in with invalid credentials

    Given the user is on the login page <"https://www.gametwist.com/en/">
    When the user provides invalid login credentials <"feydicirzo1"> <"<"1234abc!@#">">
    And clicks on the login button
    Then the system displays an error message <"Incorrect nickname/password combination.">
    And the user cannot proceed with login

@Automatable
  Scenario: Users are automatically logged in with saved credentials

    Given the user has previously logged in and selected "Log in automatically"
    When the user opens the application
    Then the user is automatically logged in without entering credentials
    And is redirected to the home page

  Scenario: Users can reset their password using the "Forgot Password" feature

    Given the user is on the login page <"https://www.gametwist.com/en/">
    When the user clicks on the "Forgot Password" link
    And provides a valid email address <"feydicirzo@gufum.com"> and nickname <"feydicirzo"> for password recovery
    And submits the password recovery form
    And the user receives a success message<"If there is an account matching your email address on our website, you will receive an email with a link to reset your password.">
    Then the user receives a password reset email

    When the user clicks on the change password link in the email
    And provides a Nickname <"feydicirzo"> and new password <"1234asd!@#">
    And clicks on the submit button
    Then the user receives a success message <"Your password has been successfully updated. You can log in now.">
    And can log in with the new password