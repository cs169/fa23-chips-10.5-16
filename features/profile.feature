# profile.feature

Feature: Profile Page
  As a user
  I want to see the profile of a specific representative
  So that I can get more information about them

 Background:
   Given I am on the representatives #search page with the address "Berkeley"
    And the following representatives exist:
      | Name              | Office                          |
      | Joseph R. Biden   | President of the United States  |

  Scenario: Search and View Representative Profile
    When I click on "Joseph R. Biden"
    Then I should be on the representative details page for "Joseph R. Biden"
    And I should land on the representative's profile page
    And I should see the representative's contact address
    And I should see the representative's political party
    And I should see the representative's photo

