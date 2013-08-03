Twitter.configure do |config|
	if Rails.env.production?
	  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
	  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
	else
		config.consumer_key = ENV['TEST_TWITTER_CONSUMER_KEY']
	  config.consumer_secret = ENV['TEST_TWITTER_CONSUMER_SECRET']
	end
end
