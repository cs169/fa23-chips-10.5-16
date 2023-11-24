require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe '#search' do
    it 'renders the search page with representatives on successful API response' do
      address = '123 Main St'
      allow(controller).to receive(:params).and_return({ address: address })

      # Stub Google API response
      allow_any_instance_of(Google::Apis::CivicinfoV2::CivicInfoService)
        .to receive(:representative_info_by_address)
        .with(address: address)
        .and_return(stub_successful_response)

      get :search

      expect(response).to render_template('representatives/search')
      expect(assigns(:representatives)).to be_present
    end

    it 'renders the search page with empty representatives on empty address' do
      allow(controller).to receive(:params).and_return({ address: '' })

      get :search

      expect(response).to render_template('representatives/index')
      expect(assigns(:representatives)).to be_empty
      expect(flash.now[:alert]).to be_present
    end

    it 'renders the search page with empty representatives on failed API response' do
      address = '123 Main St'
      allow(controller).to receive(:params).and_return({ address: address })

      # Stub Google API response to simulate an error
      allow_any_instance_of(Google::Apis::CivicinfoV2::CivicInfoService)
        .to receive(:representative_info_by_address)
        .with(address: address)
        .and_raise(Google::Apis::ClientError, 'API error message')

      get :search

      expect(response).to render_template('representatives/index')
      expect(assigns(:representatives)).to be_empty
      expect(flash.now[:alert]).to be_present
    end
  end

  # Helper method to stub a successful Google API response
  def stub_successful_response
    # Customize this method based on the structure of your API response
    # For simplicity, returning a hash with representative data
    { officials: [{ name: 'John Doe' }], offices: [{ name: 'Mayor' }] }
  end
end
