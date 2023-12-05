Feature: Create News Item
  As a user
  I want to create a new news item

  Background:
    Given the following representatives exist:
      | name         |
      | John Doe     |
      | Jane Smith   |
    And I am on the new news item page

  Scenario: Successfully creating a news item
    When I select "Immigration" from "selected_issue"
    And I select "Gavin Newsom" from "selected_representative"
    And I press "Search"
    Then I should see "News item was successfully created."
    And I should see "New News Item"

  Scenario: Failing to create a news item without a title
    When I fill in "Description" with "A description of the news item"
    And I press "Create News item"
    Then I should see "An error occurred when creating the news item."
