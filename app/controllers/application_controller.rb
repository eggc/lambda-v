class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || browser_locale || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def browser_locale
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
