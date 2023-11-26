# features/step_definitions/profile_steps.rb


When('I view the representative\'s profile with ID {string}') do |id|
  visit "/representatives/#{id}"  # Update with the correct route if different
end

Then('I should be on the profile page of the representative with ID {string}') do |id|
  expect(page).to have_current_path("/representatives/#{id}")
end
