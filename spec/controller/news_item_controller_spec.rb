# frozen_string_literal: true

require 'rails_helper'
RSpec.describe NewsItemsController, type: :controller do
=begin
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new news item' do
        expect do
          post :create,
               params: { news_item: { title: 'Test Title', description: 'Test Description', link: 'http://example.com',
representative_id: 10 } }
        end.to change(NewsItem, :count).by(1)

        expect(response).to redirect_to(representative_news_item_path(assigns(:representative), assigns(:news_item)))
        expect(flash[:notice]).to eq('News item was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new news item' do
        expect do
          post :create,
               params: { news_item: { title: '', description: 'Test Description', link: 'http://example.com',
representative_id: 10 } }
        end.not_to change(NewsItem, :count)

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq('An error occurred when creating the news item.')
      end
    end
  end
=end
  describe 'API get top5' do
    it 'properly calls api' do
      # allow(controller).to_receive('get')
    end
  end
end
