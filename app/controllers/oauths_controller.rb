class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    session[:return_to_url] = request.referer unless request.referer =~ /oauth/
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]

    if login_from(provider)
      redirect_to(home_path)
    else
      user = create_from(provider)
      auto_login(user)
      redirect_to(home_path)
    end
  end
end
