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
end
