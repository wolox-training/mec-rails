shared_context 'Authenticated User' do
    include Devise::Test::ControllerHelpers
    let(:user) { create(:user) }
    before do
      request.headers.merge! user.create_new_auth_token
    end
  end