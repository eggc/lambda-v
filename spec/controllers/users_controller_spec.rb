require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    before { get(:new) }
    it { expect(response).to have_http_status(:success) }
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        params = { user: { email: 'alice@example.com', password: '3bt2[J!' } }
        post(:create, params: params)
      end

      it { expect(response).to redirect_to(root_path) }
      it { expect(User.count).to eq(1) }
      it { expect(User.first.email).to eq('alice@example.com') }
    end

    context "invalid params" do
      before do
        params = { user: { email: 'alice@example.com', password: nil } }
        post(:create, params: params)
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(User.count).to eq(0) }
    end
  end
end
