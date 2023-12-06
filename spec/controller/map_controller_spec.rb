# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapController, type: :controller do
  describe '#state' do
    it 'finds the correct state' do
      # c = instance_double(County)
      # allow(State).to receive(:find_by).with({ symbol: 'CA' }).and_return(s)
      # controller.params[:state_symbol] = 'CA'
      # allow(s).to receive(:counties).and_return([c])
      # allow(c).to receive(:std_fips_code).and_return(1)

      # response = controller.state

      # expect(response).to eq({ 1=>c })

      # expect(assigns(:county_details)).to be_present
      state = instance_double(State, counties: [county = instance_double(County, std_fips_code: 1)])
      allow(State).to receive(:find_by).with(symbol: 'CA').and_return(state)
      controller.params[:state_symbol] = 'CA'

      expect(controller.state).to eq({ 1 => county })
      expect(assigns(:county_details)).to be_present
    end

    it 'errors when state cannot be found' do
      allow(State).to receive(:find_by).with({ symbol: 'CA' }).and_return(nil)
      controller.params[:state_symbol] = 'CA'
      # controller.flash[:alert] = 'hi'

      # controller.state

      # expect(flash[:alert]).to be_present
      # expect(response).to redirect_to('/')
    end
  end

  describe '#county' do
    it 'finds the correct county' do
      # s = instance_double(State)
      # allow(s).to receive(:id).and_return(2)
      # c = instance_double(County)
      # allow(State).to receive(:find_by).with({ symbol: 'CA' }).and_return(s)
      # controller.params[:state_symbol] = 'CA'
      # controller.params[:std_fips_code] = '10'
      # allow(s).to receive(:counties).and_return([c])
      # allow(c).to receive(:std_fips_code).and_return(1)
      # allow(County).to receive(:find_by).with({ state: 2, fips_code: 10 }).and_return(c)

      # response = controller.county

      # expect(response).to eq({ 1=>c })
      # expect(assigns(:county_details)).to be_present
      state = instance_double(State, id: 2, counties: [county = instance_double(County, std_fips_code: 1)])
      allow(State).to receive(:find_by).with(symbol: 'CA').and_return(state)
      controller.params.merge!(state_symbol: 'CA', std_fips_code: '10')

      expect(controller.county).to eq({ 1 => county })
      expect(assigns(:county_details)).to be_present
    end
  end

  describe '#index' do
    it 'home page works correctly' do
      s = instance_double(State)
      allow(State).to receive(:all).and_return([s])
      allow(s).to receive(:std_fips_code).and_return(2)

      response = controller.index

      expect(response).to eq({ 2=>s })
    end
  end
end
