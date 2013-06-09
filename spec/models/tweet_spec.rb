require 'spec_helper'

describe Tweet do
  describe 'Estlin' do

	 	it 'reads the text file which it gets tweets from.' do
	 		t = Tweet.new
	 		tweet = t.get_tweet_from_file
	 		expect(tweet).to eq("The third tweet.")
		end

		it 'saves the latest tweet to a new record in the Tweet table.' do
			t = Tweet.new
			tweet = t.get_tweet_from_file
			t.text = tweet
			t.save
			expect(Tweet.last.text).to eq("The third tweet.")
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

		it "reads a specific line from the text file." do
			t = Tweet.new
			tweet = t.get_specific_tweet_from_file(3)
			expect(tweet).to eq("The third tweet.")
		end

		it "saves the latest tweet and removes it from the text file." do
			t = Tweet.new
			tweet = t.get_tweet_and_delete_from_file(3)
			new_line = t.get_specific_tweet_from_file(3)
			expect(tweet).to_not eq(new_line)
			expect(new_line).to eq("The fourth tweet.")
		end
 	end
end
