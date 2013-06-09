require 'spec_helper'

describe Tweet do
  describe 'Estlin' do

	 	it 'reads the text file which it gets tweets from.' do
	 		t = Tweet.new
	 		tweet = t.get_tweet_from_file
	 		expect(tweet).to eq("This is the latest test tweet.")
		end

		it 'saves the latest tweet to a new record in the Tweet table.' do
			t = Tweet.new
			tweet = t.get_tweet_from_file
			t.text = tweet
			t.save
			expect(Tweet.last.text).to eq("This is the latest test tweet.")
		end

		it "checks the Tweet table so that it doesn't tweet the same status twice." do
			t = Tweet.new
			tweet = t.get_tweet_from_file
			t.text = tweet
			t.save
			t2 = Tweet.new
			t2.text = tweet
			t2.save
			expect(Tweet.all.count).to eq(1)
		end
 	end
end
