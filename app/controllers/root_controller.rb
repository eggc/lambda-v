class RootController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    redirect_to(logged_in? ? home_path : new_sessions_path)
  end
end
