require 'spec_helper'

 describe 'Estlin' do
 	it 'displays the last status that was tweeted.' do
 		t = Tweet.new
		tweet = t.get_tweet_from_file
		t.text = tweet
		t.save
 		visit "/"
 		expect(page).to have_content("The third tweet.")
 	end

 end