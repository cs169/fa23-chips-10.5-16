# frozen_string_literal: true
require 'news-api'

class NewsItemsController < ApplicationController
  before_action :set_representative
  before_action :set_news_item, only: %i[show]

  def index
    @news_items = @representative.news_items
  end

  def show; end

  private

  def set_representative
    if params[:selected_representative].present?
      @representative = Representative.find(params[:selected_representative])
    else
      @representative = Representative.find(params[:representative_id])
    end
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  def get_top5_from_api
    apikey = Rails.application.credentials[:NEWS_API_KEY]
    n = News.new(apikey)

    response = n.get_top_headlines(q: "#{@representative.name}%20#{params[:selected_issue])

    if response["status"].eq "error"
      #errors
    else 
      articles = response.articles
      parsed_articles = []
      articles.each do |article|
        item = NewsItem.news_api_to_params(article, params[:representative_id])
        parsed_articles.push(item)
      end
      return parsed_articles
  end


end
