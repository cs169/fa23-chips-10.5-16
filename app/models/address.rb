# frozen_string_literal: true
class Address
  attr_accessor :line1, :city, :state, :zip

  def initialize(line1, city, state, zip)
    @line1 = line1
    @city = city
    @state = state
    @zip = zip
  end
end