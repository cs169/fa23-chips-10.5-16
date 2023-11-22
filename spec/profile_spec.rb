require 'rails_helper'

RSpec.feature 'Profile Page', type: :feature do
  let(:representative) { FactoryBot.create(:representative, address: '123 Main St', political_party: 'Example Party') }

  scenario 'Search and View Representative Profile' do
    # Stubbing the API call
    stub_request(:get, /www.googleapis.com\/civicinfo\/v2\/representatives/).
      with(query: hash_including({ 'address' => '123 Main St' })).
      to_return(status: 200, body: File.read(Rails.root.join('spec', 'fixtures', 'api_responses', 'representatives_response.json')))
    # Scenario 1: Search for Representatives
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
