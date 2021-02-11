module Discogs
  class UserAuth
    def initialize(user)
      @user              = user
      @user_token        = user.token
      @user_secret_token = user.secret_token
    end

    def access_token
      OAuth::AccessToken.new(oauth_consumer, @user_token, @user_secret_token)
    end

    private

    def oauth_consumer
      OAuth::Consumer.new(
        ENV['DISCOGS_API_KEY'],
        ENV['DISCOGS_API_SECRET'],
        site: "https://api.discogs.com"
      )
    end
  end
end
