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
    When I fill in "Title:" with "New News Item"
    And I fill in "news_item_description" with "A description of the news item"
    And I select "John Doe" from "Representative"
    And I press "Create News item"
    Then I should see "News item was successfully created."
    And I should see "New News Item"

  Scenario: Failing to create a news item without a title
    When I fill in "Description" with "A description of the news item"
    And I press "Create News item"
    Then I should see "An error occurred when creating the news item."
