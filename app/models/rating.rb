# frozen_string_literal: true

# app/models/rating.rb
class Rating < ApplicationRecord
  belongs_to :representative
end
