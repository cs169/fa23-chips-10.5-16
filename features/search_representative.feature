# features/searching_for_representatives.feature

Feature: Searching for Representatives
  As a user
  I want to search for representatives by address
  So that I could see all representatives close to this address

Background:
    Given I am on the representatives page

Scenario: Successful search
    When I enter "Berkeley" and click "Search"
    Then I am on the search representatives page
    Then I should see "Kamala D. Harris"
    And I should see "Alex Padilla"
    And I should not see "Failed to find representative information. Please enter a valid address."

  Scenario: Empty address search
    Given I am on the search page
    When I leave the address field empty and click "Search"
    Then I should see the index page
    And I should see an error message
    And I should not see "Kamala D. Harris"
    And I should not see "Alex Padilla"

  Scenario: Failed search
    Given I am on the search page
    When I enter "DC" and click "Search"
    Then I should see an error message
    And I should not see "Kamala D. Harris"
    And I should not see "Alex Padilla"
