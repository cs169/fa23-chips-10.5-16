# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe '#counties' do
    it 'renders the correct view' do
      # s = instance_double(State)
      # c = instance_double(County)
      # allow(State).to receive(:find_by).with({ symbol: 'CA' }).and_return(s)
      # controller.params[:state_symbol] = 'CA'
      # allow(s).to receive(:counties).and_return([c])

      # allow(controller).to receive(:render).and_return(true)

      # response = controller.counties

      # expect(response).to be(true)
      state = instance_double(State, counties: [instance_double(County)])
      allow(State).to receive(:find_by).with(symbol: 'CA').and_return(state)
      controller.params[:state_symbol] = 'CA'
      allow(controller).to receive(:render).and_return(true)

      expect(controller.counties).to be(true)
    end
  end
end
