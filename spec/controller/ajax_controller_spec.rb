require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe '#counties' do
    it 'renders the correct view' do 
      s = double(State)
      c = double(County)
      allow(State).to receive(:find_by).with({:symbol => 'CA'}).and_return(s)
      controller.params[:state_symbol] = 'CA'
      allow(s).to receive(:counties).and_return([c])

      allow(controller).to receive(:render).and_return(true)

      response = controller.counties

      expect(response).to eq(true)
    end
  end
end