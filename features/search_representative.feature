# features/searching_for_representatives.feature

Feature: Searching for Representatives
  As a user
  I want to search for representatives by address
  So that I could see all representatives close to this address

Background:
    Given I am on the representatives page

Scenario: Successful search
    When I enter "Washington" and click "Search"
    Then I should see "Joe Biden"
    And I should not see "Failed to find representative information. Please enter a valid address."

  Scenario: Empty address search
    When I enter "" and click "Search"
    Then I should see "Failed to find representative information. Please enter a valid address."
    And I should not see "Kamala D. Harris"
    And I should not see "Alex Padilla"
