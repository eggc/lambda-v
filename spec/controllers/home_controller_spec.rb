require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    context 'with logged in' do
      before { login_and_get(:index) }
      it { expect(response).to have_http_status(:success) }
    end

    context 'without logged in' do
      before { get(:index) }
      it { expect(response).to redirect_to(root_path) }
    end
  end
end
