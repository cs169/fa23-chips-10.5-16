class AddRatingToNewsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :rating, :datatype
  end
end