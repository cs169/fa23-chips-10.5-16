# features/step_definitions/representative_steps.rb
# features/step_definitions/search_steps.rb

Given(/^I am on the search page with the address "([^"]*)"$/) do |address|
  visit search_page_path(address: address)
end


When('I click on the representative\'s name') do
  # Code to simulate clicking on the representative's name
end

Then('I should land on representative\'s profile') do
  # Code to verify that the user is on the Representative Profile Page
end

And('I should see the representative\'s contact address') do
  # Code to verify that the contact address is displayed
end

And('I should see the representative\'s political party') do
  # Code to verify that the political party is displayed
end

And('I should see the representative\'s photo') do
  # Code to verify that the representative's photo is displayed
end