Feature: Display rep list after clicking on a county from map

  As a citizen
  So I can easily see who the elected officials are for any county
  I want to be able to visually pick the county

Background: I have opened the app and clicked on California

Scenario: Click on a county from the map
  When I go to state/CA
  When I click on Alameda County
  Then I should see a representatives table

Scenario: Click on a county from the list
  When I click on the link "Counties in California"
  And I choose Alameda County from the lists
  Then I should see a representatives table