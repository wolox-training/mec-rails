require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'When puts on a new Book Suggestion' do
      let!(:bsuggestion_params) do
        attributes_for(:book_suggestion)
      end
      before do
        post :create, params: { book_suggestion: bsuggestion_params }
      end
      it 'Json with the new suggestion' do
        expect(response_body['title']).to eq(bsuggestion_params.as_json['title'])
      end
      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When try to insert a new Book Suggestion but some params are missing' do
      let!(:bsuggestion_params) do
        booksugg_autogenerate = attributes_for(:book_suggestion)
        booksugg_autogenerate.as_json(only: %i[price genre])
      end
      before do
        post :create, params: { book_suggestion: bsuggestion_params }
      end
      it 'responds with 402 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
