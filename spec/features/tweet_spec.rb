require 'spec_helper'

describe 'Tweet' do
	let!(:twitter_user) { FactoryGirl.create(:twitter_user) }

	def valid_sign_in_via_twitter
		visit root_path
		mock_omniauth_sign_in
		click_link "Sign in with"
	end

	def valid_tweet_form_input
		fill_in "Text", :with => "This is a test scheduled tweet."
		select "2013", :from => "tweet_scheduled_time_1i"
		select "August", :from => "tweet_scheduled_time_2i"
		select "4", :from => "tweet_scheduled_time_3i"
		select "18", :from => "tweet_scheduled_time_4i"
		select "00", :from => "tweet_scheduled_time_5i"
		click_button "Schedule Tweet"
	end

	describe '- input form -' do
		it 'input form should only be visible when logged in.' do
			valid_sign_in_via_twitter
			expect(page).to have_button("Schedule Tweet")
		end

		it 'input form should not be visible if not logged in.' do
			visit root_path
			expect(page).to_not have_button("Schedule Tweet")
		end

		it 'input form is invalid if any fields are not filled in.' do
			valid_sign_in_via_twitter
			click_button "Schedule Tweet"
			expect(page).to have_content("can't be blank")
			expect(Tweet.all.count).to be(0)
		end

		it 'input form is valid if all fields are filled in.' do
			valid_sign_in_via_twitter
			valid_tweet_form_input
			expect(page).to have_content("Tweet has been scheduled")
			expect(Tweet.all.count).to be(1)
		end
	end

	it 'will be added to delayed_job process queue when scheduled.' do
		valid_sign_in_via_twitter
		valid_tweet_form_input
		expect(page).to have_content("Tweet has been scheduled")
		expect(Delayed::Job.count).to eq(1)
		expect(Delayed::Job.last.handler).to have_content("This is a test scheduled tweet.")
	end

	describe '- will be tweeted -' do
		before(:each) do
			test_time = Time.utc(2013, 8, 3, 18, 0, 0)
			Timecop.freeze(test_time)
		end

		after(:each) { Timecop.return }

		it 'only at the time specified by its scheduled_time column.' do
			valid_sign_in_via_twitter
			valid_tweet_form_input
			expect(Delayed::Job.count).to eq(1)
			scheduled_time_of_test_tweet = Time.utc(2013, 8, 4, 18, 0, 0)
			expect(Tweet.first.scheduled_time).to eq(scheduled_time_of_test_tweet)
			Timecop.travel(Time.now + 5.days)
			successes, failures = Delayed::Worker.new.work_off
			expect(successes).to eq(1)
			expect(failures).to eq(0)
			expect(Delayed::Job.count).to eq(0)
			expect(Tweet.first.was_tweeted).to eq(true)
		end
	end

	describe '- will not be tweeted -' do
		before(:each) do
			test_time = Time.utc(2013, 8, 1, 18, 0, 0)
			Timecop.freeze(test_time)
		end

		after(:each) { Timecop.return }

		it 'if the time specified in its scheduled_time column has not yet happened.' do
			valid_sign_in_via_twitter
			valid_tweet_form_input
			expect(Delayed::Job.count).to eq(1)
			scheduled_time_of_test_tweet = Time.utc(2013, 8, 4, 18, 0, 0)
			expect(Tweet.first.scheduled_time).to eq(scheduled_time_of_test_tweet)
			Timecop.travel(Time.now + 2.days)
			expect(Delayed::Job.count).to eq(1)
			expect(Tweet.first.was_tweeted).to eq(false)
		end
	end
end
