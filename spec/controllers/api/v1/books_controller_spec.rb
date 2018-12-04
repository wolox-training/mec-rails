require 'rails_helper'
require 'faker'

shared_context 'Authenticated User' do
  include Devise::Test::ControllerHelpers
  let(:user) do
    User.new(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: Faker::Internet.password
    )
  end
  before do
    request.headers.merge! user.create_new_auth_token
  end
end

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  before(:all) do
    @book = Book.create(
      genre: Faker::Book.genre,
      author: Faker::Book.author,
      image: Faker::File.file_name('path/to'),
      title: Faker::Book.title,
      editor: Faker::Book.publisher,
      year: Faker::Number.number(4)
    )
    @rent = Rent.create(
      user_id: 1,
      book_id: 1,
      start: Time.zone.now,
      end: Time.zone.now
    )
  end
  describe 'GET #index' do
    context 'When fetching all the users rents' do
      before do
        request.headers.merge! user.create_new_auth_token
        get :index
      end
      it 'Json with all rents for this user' do
        expect(JSON.parse(response.body.as_json)['page'][0]['id']).to eq(@book.as_json['id'])
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When show a specific book' do
      before do
        request.headers.merge! user.create_new_auth_token
        get :show, params: { id: 1 }
      end

      it 'responses with the book as json' do
        expect(response.body.as_json).to eq(@book.to_json)
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
