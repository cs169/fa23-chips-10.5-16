# frozen_string_literal: true

class NewsItemsController < ApplicationController
  before_action :set_representative
  before_action :set_news_item, only: %i[show]

  def index
    @news_items = @representative.news_items
    Rails.logger.debug '!!!!!!'
    Rails.logger.debug @new_items
    Rails.logger.debug @representative.name
  end

  def show; end

  private

  def set_representative
    @representative = if params[:selected_representative].present?
                        Representative.find(params[:selected_representative])
                      else
                        Representative.find(params[:representative_id])
                      end
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  def get_top5_from_api
    apikey = Rails.application.credentials[:NEWS_API_KEY]
    n = News.new(apikey)

    response = n.get_top_headlines(q: "#{@representative.name} {params[:selected_issue]}")

    if response['status'].eq 'error'
      # errors
    else
      articles = response.articles
      @top_five = []
      count = 0
      articles.each do |article|
        item = NewsItem.news_api_to_params(article, params[:representative_id])
        @top_five.push(item)
        count += 1
        break if count >= 5
      end
    end
  end
end
