require 'spec_helper'

describe 'Tweet' do
	let!(:twitter_user) { FactoryGirl.create(:twitter_user) }

	it 'input form should only be visible when logged in.' do
		visit root_path
		mock_omniauth_sign_in
		click_link "Sign in with Twitter"
		expect(page).to have_button("Schedule Tweet")
	end

	it 'input form should not be visible if not logged in.' do
		visit root_path
		expect(page).to_not have_button("Schedule Tweet")
	end

	it 'input form is invalid if any fields are not filled in.' do
		visit root_path
		mock_omniauth_sign_in
		click_link "Sign in with Twitter"
		click_button "Schedule Tweet"
		expect(page).to have_content("can't be blank")
		expect(Tweet.all.count).to be(0)
	end

	it 'input form is valid if all fields are filled in.' do
		visit root_path
		mock_omniauth_sign_in
		click_link "Sign in with Twitter"
		fill_in "Text", :with => "This is a test scheduled tweet."
		select "2013", :from => "tweet_scheduled_time_1i"
		select "August", :from => "tweet_scheduled_time_2i"
		select "4", :from => "tweet_scheduled_time_3i"
		select "18", :from => "tweet_scheduled_time_4i"
		select "00", :from => "tweet_scheduled_time_5i"
		click_button "Schedule Tweet"
		expect(page).to have_content("Tweet has been scheduled")
		expect(Tweet.all.count).to be(1)
	end
end
