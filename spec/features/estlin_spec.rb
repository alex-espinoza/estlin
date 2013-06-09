require 'spec_helper'

 describe 'Estlin' do

 	it 'displays the last status that was tweeted.' do
 		s = Tweet.new
 		tweet = s.get_status_from_file
 		s.delete_status_and_update_file(tweet)
		s.post_status
 		visit "/"
 		expect(page).to have_content("tweet")
 		expect(Tweet.last.text).to eq("The first tweet.")
 	end

 end