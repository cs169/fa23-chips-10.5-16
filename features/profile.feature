# profile.feature

Feature: Profile Page
  As a user
  I want to see the profile of a specific representative
  So that I can get more information about them

  Background:
    Given I am on the representatives index page

  Scenario: Search and View Representative Profile
  
    When I input an address into the search input and click Search
    Then I should be shown a list of representatives matching the address

    And I click on the name of the representative
    Then I should land on the representative's profile page
    And I should see the representative's contact address
    And I should see the representative's political party
    And I should see the representative's photo

