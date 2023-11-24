# features/update_state_fips_data.feature

Feature: Update state FIPS data

  Scenario: Updating Alaska FIPS data
    Given I have current FIPS data for Alaska
    When I update the FIPS data for Alaska
    Then the FIPS data should reflect the changes for Kusilvak Census Area

  Scenario: Updating South Dakota FIPS data
    Given I have current FIPS data for South Dakota
    When I update the FIPS data for South Dakota
    Then the FIPS data should reflect the changes for Oglala Lakota County

  Scenario: Removing obsolete FIPS data for Virginia
    Given I have current FIPS data for Virginia
    When I remove obsolete FIPS data for Virginia
    Then the FIPS data should not include Bedford City
