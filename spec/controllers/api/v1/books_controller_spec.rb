require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the users rents' do
      let!(:book) { create(:book) }
      before do
        get :index
      end
      it 'Json with all rents for this user' do
        expect(response_body['page'][0]['id']).to eq(book.id)
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When show a specific book' do
      let!(:book) { create(:book) }
      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book as json' do
        expect(
          response_body['id']
        ).to eq(book.id)
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
