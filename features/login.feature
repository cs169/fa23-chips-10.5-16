Feature: User authentication

  Scenario: Logging in with Google
    Given I am on the login page
    When I click on "Sign in with Google"
    Then I should be redirected to the home page

  Scenario: Logging in with GitHub
    Given I am on the login page
    When I click on "Sign in with GitHub"
    Then I should be redirected to the home page


  Scenario: Already logged in user attempts to log in
    Given I am already logged in
    When I go to the login page