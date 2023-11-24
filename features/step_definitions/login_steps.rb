# features/step_definitions/authentication_steps.rb

Given 'I am on the login page' do
  visit login_path
end

When 'I click on {string}' do |link_name|
  click_link_or_button link_name
end

Then 'I should be redirected to the home page' do
  expect(current_path).to eq root_path
end

And 'I should see my {string} name on the page' do |provider|
  name = provider == 'Google' ? 'Google Test User' : 'GitHub Test User'
  expect(page).to have_content(name)
end

Given 'I am logged in' do
  # Create a user record directly
  User.create(uid: '12345', provider: 'google_oauth2', first_name: 'Test', last_name: 'User', email: 'test@example.com')
  # Simulate the user being logged in, e.g., by setting a session variable.
  # This step may require you to use a method or tool to simulate a logged-in state.
end

Then 'I should be redirected to the login page' do
  expect(current_path).to eq new_user_session_path
end

And 'I should see {string}' do |message|
  expect(page).to have_content(message)
end

Given 'I am already logged in' do
  step 'I am logged in'
  # Ensure that the login step sets up the session or cookie needed to be logged in
  visit login_path
 
end

When 'I go to the login page' do
  visit login_path
end

Then 'I should be redirected to the user profile page' do
  expect(current_path).to eq user_profile_path
end
