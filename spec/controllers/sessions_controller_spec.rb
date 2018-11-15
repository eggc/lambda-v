require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    User.create(email: 'alice@example.com', password: '3bt2[J!')
  end

  describe "GET #new" do
    before { get(:new) }
    it { expect(response).to have_http_status(:success) }
  end

  describe "POST #create" do
    def post_with(session_params)
      post(:create, params: { session: session_params })
    end

    context "with valid params" do
      before { post_with(email: 'alice@example.com', password: '3bt2[J!') }
      it { expect(response).to redirect_to(root_path) }
      it { expect(controller).to be_logged_in }
    end

    context "with wrong password" do
      before { post_with(email: 'alice@example.com', password: 'wrong-password') }
      it { expect(response).to have_http_status(:success) }
      it { expect(controller).not_to be_logged_in }
    end
  end

  describe "DELETE #destroy" do
    before do
      controller.auto_login(User.first)
      delete(:destroy)
    end

    it { expect(controller).not_to be_logged_in }
  end
end
