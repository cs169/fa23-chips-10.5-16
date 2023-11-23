# features/step_definitions/search_steps.rb

When("I enter {string} and click {string}") do |address, button_text|
  fill_in 'address', with: address
  click_button button_text
end

Then /^I should see the following text (.*)$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should not see the following text (.*)$/ do |text|
  expect(page).not_to have_content(text)
end

