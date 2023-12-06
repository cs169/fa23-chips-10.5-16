Feature: Create News Item
  As a user
  I want to create a new news item

  Background:
    Given I am on the login page
    When I click on "Sign in with GitHub"
    Then I should be redirected to the home page
    Given the following representatives exist:
      | name         |
      | John Doe     |
      | Jane Smith   |
      | Christina Henderson  |
    And I am on the new news item page
   
   Scenario: Can't find an article
    When I choose "Social Security and Medicare" from the "selected_issue" dropdown
    And I choose "Christina Henderson" from the "selected_representative" dropdown
    And I press "Search"
    Then I should see "No search result! Please choose a different representative or issue."

  Scenario: Successfully creating a news item
    When I choose "Immigration" from the "selected_issue" dropdown
    And I choose "Jane Smith" from the "selected_representative" dropdown
    And I press "Search"
    Then I should see "Select an article"
    When I choose "3" from the "rating" dropdown
    And I press "Update News Item"

