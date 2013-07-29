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

end