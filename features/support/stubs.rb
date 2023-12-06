# frozen_string_literal: true

def stub_successful_response
  office_data = [Office.new('president', 'ocd-division/country:us/state:ny', [0])]
  biden_address = Address.new('1600 Pennsylvania Ave NW', 'Washington', 'DC', '20500')

  # Create Official instance with the Address array
  official_data = [Official.new('Joe Biden', [biden_address], 'Democratic Party', '')]

  RepInfo.new(office_data, official_data)
end

def stub_unsucessful_response
  nil
end
