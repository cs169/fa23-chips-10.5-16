# frozen_string_literal: true
require 'google/apis/civicinfo_v2'

class SearchController < ApplicationController
  def search
    address = params[:address]

    if address.blank?
      @representatives = []
      flash.now[:alert] = 'Failed to find representative information. Please enter a valid address.'
    else
      begin
        service = Google::Apis::CivicinfoV2::CivicInfoService.new
        service.key = Rails.application.credentials[:GOOGLE_API_KEY]
        result = service.representative_info_by_address(address: address)
        @representatives = Representative.civic_api_to_representative_params(result)
        render 'representatives/search'  # Render only on success
        return
      rescue Google::Apis::ClientError => e
        Rails.logger.error("Google API Error: #{e.message}")
        flash.now[:alert] = 'Failed to find representative information. Please enter a valid address.'
      end
    end
    # Render 'representatives/search' for both error and empty address cases
    render '/representatives/index'
  end
end
