class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    session[:return_to_url] = request.referer unless request.referer =~ /oauth/
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    user = login_from(provider)

    ActiveRecord::Base.transaction do
      unless user
        user = create_from(provider)
        auto_login(user)
      end

      external_user = user.external_users.find_by(provider: provider)
      external_user.update!(token: access_token.token, secret: access_token.secret)
    end

    redirect_to(home_path)
  end
end
