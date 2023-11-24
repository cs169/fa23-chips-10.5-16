# spec/model/representative_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe '.civic_api_to_representative_params' do
    office_data = [Office.new('senator', 'ocd-division/country:us/state:ny', [0])]
    official_data = [Official.new('Bob')]

    rep_info = RepInfo.new(office_data, official_data)

    context 'when the representative does not exist' do
      it 'creates a new representative' do
        expect { described_class.civic_api_to_representative_params(rep_info) }
          .to change(described_class, :count).by(1)
      end
    end

    context 'when the representative already exists' do
      before do
        described_class.create!(name: 'Bob', ocdid: 'ocd-division/country:us/state:ny', title: 'senator')
      end

      it 'does not create a new representative' do
        expect { described_class.civic_api_to_representative_params(rep_info) }
          .not_to change(described_class, :count)
      end
    end
  end
end
