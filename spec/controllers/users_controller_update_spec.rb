require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'PATCH #update' do
    def build_params(new_attribute)
      { id: @user.id, user: new_attribute }
    end

    before do
      @user = create(:user)
      @update_params = build_params(email: 'new@example.com', password: 'xyz')
      @invalid_params = build_params(email: '', password: '')
    end

    context 'with login' do
      before { controller.auto_login(@user) }

      context 'valid params' do
        before { patch(:update, params: @update_params) }
        it { expect(response).to redirect_to(root_path) }
        it { expect(@user.reload.email).to eq('new@example.com') }
      end

      context 'invalid params' do
        before { patch(:update, params: @invalid_params) }
        it { expect(response).to have_http_status(:success) }
        it { expect(@user.reload.email).to eq('alice@example.com') }
      end
    end

    context 'without login' do
      before { patch(:update, params: @update_params) }
      it { expect(response).to redirect_to(root_path) }
      it { expect(@user.reload.email).to eq('alice@example.com') }
    end
  end
end
