# require 'spec_helper'

# describe Tweet do
#   describe 'Estlin' do

#   	after(:each) { Tweet.destroy_all }
#   	### Add another after here that remakes the test.txt file with all tweets for better tests - maybe use TempFile.copy? copy from another directory (untouched tweet file)

# 	 	it 'reads the text file which it gets tweets from.' do
# 	 		s = Tweet.new
# 	 		tweet = s.get_status_from_file
# 	 		expect(tweet).to include("tweet")
# 		end

# 		it 'saves the latest tweet to a new record in the Tweet table.' do
# 			s = Tweet.new
# 			tweet = s.get_status_from_file
# 			s.delete_status_and_update_file(tweet)
# 			s.post_status
# 			expect(Tweet.last.text).to include("tweet")
# 		end

# 		it "checks the Tweet table so that it doesn't tweet the same status twice." do
# 			Tweet.create(:text => "The second tweet.")
# 			s = Tweet.new
# 			tweet = s.get_status_from_file
# 			s.delete_status_and_update_file(tweet)
# 			s.post_status
# 			expect(Tweet.all.count).to eq(1)
# 		end

# 		# it "reads a specific line from the text file." do
# 		# 	t = Tweet.new
# 		# 	tweet = t.get_specific_tweet_from_file(3)
# 		# 	expect(tweet).to eq("The third tweet.")
# 		# end

# 		it "saves the latest tweet and removes it from the text file." do
# 			s = Tweet.new
# 			tweet = s.get_status_from_file
# 			s.delete_status_and_update_file(tweet)
# 			s2 = Tweet.new
# 			tweet2 = s2.get_status_from_file
# 			expect(tweet).to eq("The third tweet.")
# 			expect(tweet).to_not eq(tweet2)
# 			expect(tweet2).to eq("The fourth tweet.")
# 		end
#  	end
# end
