Feature: Managing News Items
  As a user
  I want to manage news items
  So that I can keep the representative's news updated

  Background: 
    Given a representative exists

  Scenario: Creating a new news item
    Given I am on the new news item page
    When I fill in the news item details
    And I press "Create News item"
    Then I should see "News item was successfully created."
    And the news item should be in the database

  Scenario: Editing an existing news item
    Given an existing news item
    And I am on the edit news item page
    When I update the news item details
    And I press "Update News item"
    Then I should see "News item was successfully updated."
    And the news item should be updated in the database

  Scenario: Deleting a news item
    Given an existing news item
    When I press "Delete"
    Then I should see "News was successfully destroyed."
    And the news item should be removed from the database
