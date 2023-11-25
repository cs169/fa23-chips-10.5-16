require 'rails_helper'

RSpec.describe MapController, type: :controller do
  describe '#state' do
    it 'finds the correct state' do 
      state_symbol = 'WA'
      s = double(State)
      c = double(County)
      allow(State).to receive(:find_by).with({:symbol => 'CA'}).and_return(s)
      controller.params[:state_symbol] = 'CA'
      allow(s).to receive(:counties).and_return([c])
      allow(c).to receive(:std_fips_code).and_return(1)
      
      response = controller.state
      
      expect(response).to eq({1=>c})
      
      expect(assigns(:county_details)).to be_present
    end
  end
end