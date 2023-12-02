Feature: Delete News Item
  As a user
  I want to delete a news item

  Background:
    Given the following news items exist:
      | title             | description                       |
      | Deletable News    | This news item will be deleted.   |
    And I am on the news items page

  Scenario: Successfully deleting a news item
    Given I have a news item titled "Deletable News"
    When I press "Delete" next to "Deletable News"
    Then I should see "News was successfully destroyed."
    And I should not see "Deletable News"
