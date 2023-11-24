# features/step_definitions/search_steps.rb

# When("I enter {string} and click {string}") do |address, button_text|
#   fill_in 'address', with: address
#   click_button button_text
# end

When('I enter {string} and click {string}')  do |address, button_text|
  # Stubbing the external API call in the controller
 
    fill_in 'address', with: address
    click_button button_text
    allow_any_instance_of(Google::Apis::CivicinfoV2::CivicInfoService)
    .to receive(:representative_info_by_address)
    .with(address: address)
    .and_return(stub_successful_response)

end

Then /^I should see the following text (.*)$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should not see the following text (.*)$/ do |text|
  expect(page).not_to have_content(text)
end




def stub_successful_response
  {
    "kind" => "civicinfo#representativeInfoResponse",
    "normalizedInput" => {
      "locationName" => "Sample Location",
      "line1" => "123 Main Street",
      "city" => "Sample City",
      "state" => "SS",
      "zip" => "12345"
    },
    "divisions" => {
      "division_key_1" => {
        "name" => "Division Name 1",
        "alsoKnownAs" => ["Alias 1", "Alias 2"],
        "officeIndices" => [0, 1]
      },
      "division_key_2" => {
        "name" => "Division Name 2",
        "alsoKnownAs" => ["Alias 3", "Alias 4"],
        "officeIndices" => [2]
      }
    },
    "offices" => [
      {
        "name" => "Office Name 1",
        "divisionId" => "division_key_1",
        "levels" => ["Level 1"],
        "roles" => ["Role 1", "Role 2"],
        "sources" => [{"name" => "Source 1", "official" => true}],
        "officialIndices" => [0, 1]
      },
      {
        "name" => "Office Name 2",
        "divisionId" => "division_key_1",
        "levels" => ["Level 2"],
        "roles" => ["Role 3"],
        "sources" => [{"name" => "Source 2", "official" => false}],
        "officialIndices" => [2]
      },
      {
        "name" => "Office Name 3",
        "divisionId" => "division_key_2",
        "levels" => ["Level 3"],
        "roles" => ["Role 4"],
        "sources" => [{"name" => "Source 3", "official" => true}],
        "officialIndices" => [3]
      }
    ],
    "officials" => [
      {
        "name" => "Kamala D. Harris",
        "address" => [
          {"locationName" => "1600 Pennsylvania Avenue Northwest", "line1" => "", "city" => "Washington", "state" => "DC", "zip" => "20500"}
        ],
        "party" => "Democratic Party",
        "phones" => ["111-222-3333", "444-555-6666"],
        "urls" => ["http://www.official1.com"],
        "photoUrl" => "http://www.official1.com/photo.jpg",
        "emails" => ["official1@example.com"],
        "channels" => [{"type" => "Twitter", "id" => "@official1"}, {"type" => "Facebook", "id" => "official1"}]
      },
      {
        "name" => "Alex Padilla",
        "address" => [
          {"locationName" => "B03", "line1" => "", "city" => "Washington", "state" => "DC", "zip" => "20510"}
        ],
        "party" => "Democratic Party",
        "phones" => ["777-888-9999"],
        "urls" => ["http://www.official2.com"],
        "photoUrl" => "http://www.official2.com/photo.jpg",
        "emails" => ["official2@example.com"],
        "channels" => [{"type" => "Instagram", "id" => "official2"}]
      },
      {
        "name" => "Joseph R. Biden",
        "address" => [
          {"locationName" => "1600 Pennsylvania Avenue Northwest", "line1" => "", "city" => "Washington", "state" => "DC", "zip" => "20500"}
        ],
        "party" => "Democratic Party",
        "phones" => ["Phone Number for Joseph R. Biden"],
        "urls" => ["http://www.joebiden.com"],
        "photoUrl" => "http://www.joebiden.com/photo.jpg",
        "emails" => ["joe.biden@example.com"],
        "channels" => [{"type" => "Twitter", "id" => "@JoeBiden"}, {"type" => "Facebook", "id" => "joebiden"}]
      },
      {
        "name" => "Senator Oski",
        "address" => [
          {"locationName" => "1600 Berkeley", "line1" => "", "city" => "Washington", "state" => "DC", "zip" => "20500"}
        ],
        "party" => "Democratic Party",
        "phones" => ["Phone Number for Joseph R. Biden"],
        "urls" => ["http://www.joebiden.com"],
        "photoUrl" => "http://www.joebiden.com/photo.jpg",
        "emails" => ["joe.biden@example.com"],
        "channels" => [{"type" => "Twitter", "id" => "@JoeBiden"}, {"type" => "Facebook", "id" => "joebiden"}]
      }
    ]
  }
end

