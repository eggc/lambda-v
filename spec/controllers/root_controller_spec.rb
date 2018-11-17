require 'rails_helper'

RSpec.describe RootController, type: :controller do
  describe "GET #index" do
    context 'without login' do
      before { get(:index) }
      it { expect(response).to redirect_to(new_sessions_path) }
    end

    context 'with login' do
      before { login_and_get(:index) }
      it { expect(response).to redirect_to(home_path) }
    end
  end
end
