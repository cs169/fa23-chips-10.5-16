
Feature: Viewing a Representative's Profile
  As a user
  I want to view a representative's profile
  So that I can learn more about them
  
Background:                             
    Given I am on the representatives page

Scenario: Viewing a specific representative's profile
  When I enter "Washington" and click "Search"
  Then I should see "Joe Biden"
  When I click on "Joe Biden"
  Then I view the Joe Biden's profile with ID 1092

