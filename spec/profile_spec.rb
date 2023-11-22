require 'rails_helper'

RSpec.feature 'Profile Page', type: :feature do
  let(:representative) { FactoryBot.create(:representative, address: '123 Main St', political_party: 'Example Party') }

  scenario 'Search and View Representative Profile' do
    visit representatives_path
    fill_in 'address', with: '123 Main St'
    click_button 'Search'

    expect(page).to have_content('List of Representatives')
    expect(page).to have_content(representative.name)

    # Scenario 2: View Representative Profile
    click_link representative.name

    expect(page).to have_content("Profile of #{representative.name}")
    expect(page).to have_content("Contact Address: #{representative.address}")
    expect(page).to have_content("Political Party: #{representative.political_party}")
    expect(page).to have_css("img[src*='#{representative.photo_url}']") # Assuming a photo_url attribute

    # Add additional expectations as needed for other representative details
  end
end
