require 'rails_helper'
require 'support/shared_contexts/shared_authenticated.rb'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the users rents' do
      before do
        @book = create(:book)
        @rent = Rent.create(
          user_id: 1,
          book_id: 1,
          start: Time.zone.now,
          end: Time.zone.now
        )
        get :index
      end
      it 'Json with all rents for this user' do
        expect(response_body['page'][0]['id']).to eq(@book.as_json['id'])
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When show a specific book' do
      before do
        @book = create(:book)
        get :show, params: { id: @book.id }
      end

      it 'responses with the book as json' do
        expect(response_body.to_json).to eq(@book.to_json)
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
