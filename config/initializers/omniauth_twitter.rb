Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.production?
	  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
	else
		provider :twitter, ENV['TEST_TWITTER_CONSUMER_KEY'], ENV['TEST_TWITTER_CONSUMER_SECRET']
	end
end

OmniAuth.config.logger = Rails.logger
