# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_issue
  before_action :set_issues_list, only: [:new, :edit, :create, :update]
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    puts @news_item
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end
  
  def update_rating
    @representative = Representative.find(params[:selected_representative])
    @news_item = NewsItem.new
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
    if params[:selected_representative].present?
      @representative = Representative.find(params[:selected_representative])
    else
      @representative = Representative.find(params[:representative_id])
    end
  end
  

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_issue
    if params[:selected_issue].present?
      @issue = params[:selected_issue]
    else 
      @issue = "Warning!!"
     end
  end

  def set_issues_list
    @issues_list = [
      "Free Speech", 
      "Immigration", 
      "Terrorism", 
      "Social Security and Medicare", 
      "Abortion", 
      "Student Loans", 
      "Gun Control", 
      "Unemployment",
      "Climate Change", 
      "Homelessness", 
      "Racism", 
      "Tax Reform", 
      "Net Neutrality", 
      "Religious Freedom", 
      "Border Security", 
      "Minimum Wage",
      "Equal Pay"
    ]
  end
  

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
  end
end
