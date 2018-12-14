require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get(:new) }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    def post_with(user_params)
      post(:create, params: { user: user_params })
    end

    context 'with valid params' do
      before { post_with(email: 'alice@example.com', password: '3bt2[J!') }
      it { expect(response).to redirect_to(root_path) }
      it { expect(User.count).to eq(1) }
      it { expect(User.first.email).to eq('alice@example.com') }
    end

    context 'without password' do
      before { post_with(email: 'alice@example.com', password: nil) }
      it { expect(response).to have_http_status(:success) }
      it { expect(User.count).to eq(0) }
    end
  end
end
