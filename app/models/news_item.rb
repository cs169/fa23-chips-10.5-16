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
    issue = params[:selected_issue]
    space = '%20'
    word = name + space + issue

    url = "https://newsapi.org/v2/everything?q=#{word}&apiKey=#{apikey}"

    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    # puts res.body if res.is_a?(Net::HTTPSuccess)

    response = res.body
    real_response = JSON.parse(response)

    if real_response['status'] == 'error'
      # errors
    else
      articles = real_response['articles']
      @top_five = []
      count = 0
      articles.each do |article|
        url = article['url']
        title = article['title']
        description = article['description']
        item = NewsItem.new(link: url, title: title, description: description,
                            representative_id: params[:representative_id])
        @top_five.push(item)
        count += 1
        break if count >= 5
      end
    end
    @top_five
  end
end
