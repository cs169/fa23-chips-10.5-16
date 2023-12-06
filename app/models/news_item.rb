# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.news_api_to_params(apikey, params, name)
    word = "#{name}%20#{params[:selected_issue]}"
    uri = URI("https://newsapi.org/v2/everything?q=#{word}&apiKey=#{apikey}")
    res = Net::HTTP.get_response(uri)
    real_response = JSON.parse(res.body)
    if real_response['status'] != 'error'
      articles = real_response['articles']
      @top_five = []
      count = 0
      articles.each do |article|
        item = NewsItem.new(link: article['url'], title: article['title'],
                            description: article['description'],
                            representative_id: params[:representative_id])
        @top_five.push(item)
        count += 1
        break if count >= 5
      end
    end
    @top_five
  end
end
