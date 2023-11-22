# frozen_string_literal: true

class RepInfo
  attr_accessor :offices, :officials

  def initialize(offices, officials)
    @offices = offices
    @officials = officials
  end
end
