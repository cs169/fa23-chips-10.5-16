# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all
  has_many :ratings, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    return [] if rep_info.nil?

    rep_info.officials.each_with_object([]) do |official, reps|
      office = find_office(rep_info, official)

      address = build_address(official.address)

      rep = Representative.find_or_create_by!(
        name:    official.name,
        ocdid:   office&.division_id || '',
        title:   office&.name || '',
        party:   official.party,
        address: address,
        photo:   official.photo_url
      )

      reps.push(rep)
    end
  end

  def self.find_office(rep_info, official)
    rep_info.offices.find { |office| office.official_indices.include?(rep_info.officials.index(official)) }
  end

  def self.build_address(address)
    return unless address

    "#{address[0].line1}, #{address[0].city}, #{address[0].state}, #{address[0].zip}"
  end
end
