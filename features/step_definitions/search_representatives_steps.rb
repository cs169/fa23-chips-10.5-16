# frozen_string_literal: true

# features/step_definitions/search_representatives_steps.rb
# When("I enter {string} and click {string}") do |address, button_text|
#   fill_in 'address', with: address
#   click_button button_text
# end

# Simulate a Google API error

When('I enter {string} and click {string}') do |address, button_text|
  # Conditionally stub the external API call
  if address == 'Washington'
    allow_any_instance_of(Google::Apis::CivicinfoV2::CivicInfoService)
      .to receive(:representative_info_by_address)
      .with(address: address)
      .and_return(stub_successful_response)
  else
    allow_any_instance_of(Google::Apis::CivicinfoV2::CivicInfoService)
      .to receive(:representative_info_by_address)
      .with(address: address)
      .and_return(stub_unsucessful_response)
  end

  fill_in 'address', with: address
  click_button button_text
end

Then /^I should see the following text (.*)$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should not see the following text (.*)$/ do |text|
  expect(page).not_to have_content(text)
end

Then('I should be on the representatives search page') do
  expect(page).to have_current_path('/representatives/search')  # Update with the correct route if different
end
