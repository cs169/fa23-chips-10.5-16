# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
    Rails.logger.debug { "DEBUG: #{@representatives.inspect}" }
  end

  def show
    @representative = Representative.find(params[:id])
  end
end
