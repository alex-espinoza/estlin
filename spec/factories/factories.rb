FactoryGirl.define do
	factory :twitter_user, class: User do
		uid "1234567"
		nickname "estlintester"
		oauth_token "2342kmlskdlakmsdlkasm"
		oauth_secret "aslsakmdlkm32m3902j"
	end

	factory :valid_tweet, class: Tweet do
		text "This is a valid tweet"
		scheduled_time "#{Time.now + 1000}"
		was_tweeted false
		user_id 1
	end
end
