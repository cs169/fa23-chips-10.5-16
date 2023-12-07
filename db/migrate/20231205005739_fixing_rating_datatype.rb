# frozen_string_literal: true

class FixingRatingDatatype < ActiveRecord::Migration[5.2]
  def change
    remove_column :news_items, :rating, :integer
    add_column :news_items, :rating, :integer
  end
end
