Feature: Edit News Item
  As a user
  I want to edit a news item

  Background:
    Given the following news items exist:
      | title             | description                       |
      | Existing News     | This is an existing news item.    |
    And I am on the edit news item page for "Existing News"

  Scenario: Successfully editing a news item
    When I fill in "Title" with "Updated News Item"
    And I press "Update News item"
    Then I should see "News item was successfully updated."
    And I should see "Updated News Item"

  Scenario: Failing to update a news item with an empty title
    When I fill in "Title" with ""
    And I press "Update News item"
    Then I should see "An error occurred when updating the news item."
