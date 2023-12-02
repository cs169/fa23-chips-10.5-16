# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_issue
  before_action :set_issues_list, only: %i[new edit create update]
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    Rails.logger.debug @news_item
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def get_top5_from_api
    apikey = Rails.application.credentials[:NEWS_API_KEY]

    issue = params[:selected_issue]
    space = '%20'
    word = @representative.name + space + issue

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
        item = NewsItem.news_api_to_params(article, params[:representative_id])
        @top_five.push(item)
        count += 1
        break if count >= 5
      end
    end
    render '/my_news_items/show'
  end

  def update_rating
    @representative = Representative.find(params[:selected_representative])
    # @news_item = NewsItem.new
    @news_item = NewsItem.new(news_item_params)
    # if @news_item.save
    #   redirect_to representative_news_item_path(@representative, @news_item),
    #               notice: 'News item was successfully created.'
    # else
    #   render :new, error: 'An error occurred when creating the news item.'
    # end
    # redirect_to representatives_path
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = if params[:selected_representative].present?
                        Representative.find(params[:selected_representative])
                      else
                        Representative.find(params[:representative_id])
                      end
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_issue
    @issue = params[:selected_issue].presence || 'Warning!!'
  end

  def set_issues_list
    @issues_list = [
      'Free Speech',
      'Immigration',
      'Terrorism',
      'Social Security and Medicare',
      'Abortion',
      'Student Loans',
      'Gun Control',
      'Unemployment',
      'Climate Change',
      'Homelessness',
      'Racism',
      'Tax Reform',
      'Net Neutrality',
      'Religious Freedom',
      'Border Security',
      'Minimum Wage',
      'Equal Pay'
    ]
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue, :rating)
  end
end
