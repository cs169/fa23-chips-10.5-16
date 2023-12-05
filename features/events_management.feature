Feature: Manage Events, Counties, and States

  Background: Basic entities exist
    Given the following states exist:
      | name       | symbol | fips_code | is_territory | lat_min | lat_max | long_min | long_max |
      | California | CA     | 6         | 0            | 32.5    | 42.0    | -124.4   | -114.1   |
      | New York   | NY     | 36        | 0            | 40.5    | 45.0    | -79.8    | -71.9    |
    And the following counties exist:
      | name        | state      | fips_code | fips_class |
      | Los Angeles | California | 37        | H1         |
      | Kings       | New York   | 47        | H4         |
    And the following events exist:
      | name               | county      | start_time           | end_time                      |
      | LA Tech Conference | Los Angeles | one week from now    | one week and 5 hours from now |
      | NY Music Festival  | Kings       | two weeks from now   | two weeks and 3 days from now |

  Scenario: Creating an event with valid times
    Given the following events exist:
      | name               | county      | start_time           | end_time                      |
      | LA Tech Conference | Los Angeles | one week from now    | one week and 5 hours from now |
      | NY Music Festival  | Kings       | two weeks from now   | two weeks and 3 days from now |

  Scenario: Attempting to create an event with invalid times
    When I try to create an event "Future Conference" in "Los Angeles" with a start time in the past
    Then the event should not be saved due to invalid start time

  Scenario: Attempting to create an event where end time is before start time
    When I try to create an event "Weird Conference" in "Los Angeles" with an end time before its start time
    Then the event should not be saved due to invalid end time

  Scenario: Creating an event with valid times and all fields populated
    Given the following events exist:
      | name                 | county      | start_time            | end_time                | description             | location                |
      | Full Detail Event    | Los Angeles | one week from now     | two weeks from now      | A fully detailed event  | Los Angeles Convention Center |
  #  Then I should see an event named "Full Detail Event"
    
  Scenario: Filtering events by state
    Given the state "California" exists
    And the state "New York" exists
    And the following events exist:
      | name               | county      | start_time           | end_time                      |
    #  | LA Tech Conference | Los Angeles | one week from now    | one week and 5 hours from now |
      | NY Music Festival  | Kings       | two weeks from now   | two weeks and 3 days from now |
    # Existing event creation remains the same
    When I filter events by state "CA"
    Then I should see events from county "Los Angeles"
    And I should not see events from county "Kings"

  #Scenario: Attempting to create an event with an empty name
   # When I try to create an event with empty name
  #  Then the event should not be saved due to invalid name

