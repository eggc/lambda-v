class TwitterAPI
  attr_reader :client

  def initialize(user_token, user_token_secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = app_tokens[:key]
      config.consumer_secret     = app_tokens[:secret]
      config.access_token        = user_token
      config.access_token_secret = user_token_secret
    end
  end

  private

  def app_tokens
    @app_tokens ||= Rails.application.credentials.twitter_auth
  end
end
