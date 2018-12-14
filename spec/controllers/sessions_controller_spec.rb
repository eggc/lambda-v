require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = create(:user)
  end

  describe 'GET #new' do
    before { get(:new) }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    def post_with(session_params)
      post(:create, params: { session: session_params })
    end

    context 'with valid params' do
      before { post_with(email: @user.email, password: '3kVa0vz2!') }
      it { expect(response).to redirect_to(home_path) }
      it { expect(controller).to be_logged_in }
    end

    context 'with wrong password' do
      before { post_with(email: @user.email, password: 'wrong') }
      it { expect(response).to have_http_status(:success) }
      it { expect(controller).not_to be_logged_in }
    end
  end

  describe 'DELETE #destroy' do
    before do
      controller.auto_login(@user)
      delete(:destroy)
    end

    it { expect(controller).not_to be_logged_in }
  end
end
