# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      
      address = "#{official.address[0].line1}, #{official.address[0].city}, #{official.address[0].state}, #{official.address[0].zip}" if official.address
      rep = Representative.create!({
        name: official.name, ocdid: ocdid_temp, title: title_temp, party: (official.party unless official.party.nil?), address: address,
        photo: official.photo_url
      })
      reps.push(rep)
    end
    reps
  end
end
