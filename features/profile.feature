# profile.feature

Feature: Profile Page
  As a user
  I want to see the profile of a specific representative
  So that I can get more information about them

  Scenario: View Representative Profile Page
    Given I am on home page
    When I click on the representative's name
    Then I should land on representative's profile
    And I should see the representative's contact address
    And I should see the representative's political party
    And I should see the representative's photo
