# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.news_api_to_params(api_response, rep_id)
    url = api_response.url
    title = api_response.title
    description = api_response.description
    item = NewsItem.create!(link: url, title: title, description: description, representative_id: rep_id)
    return item
end
