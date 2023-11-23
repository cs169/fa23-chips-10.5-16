# features/step_definitions/search_steps.rb

Given("I am on the search page") do
  visit representatives_path
end

When("I enter {string} and click {string}") do |address, button_text|
  fill_in 'address', with: address
  click_button button_text
end

Then /^I should (not )?see the following txt (.*)$/ do
  expect(page).to have_content(text)
end

Then("I should see the index page") do
  expect(page).to have_current_path(index_path)
end

Then("I should see an error message") do
  expect(page).to have_css('.alert', text: 'Failed to find representative information. Please enter a valid address.')
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end
