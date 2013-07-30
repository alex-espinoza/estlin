require 'spec_helper'

describe 'User' do
	let!(:twitter_user) { FactoryGirl.create(:twitter_user) }

	it 'is redirected to the main application page after logging in via twitter.' do
		visit root_path
		mock_omniauth_sign_in
		click_link "Sign in with Twitter"
		expect(page).to have_content("You have signed in as 'estlintester'")
		expect(User.all.count).to eq(1)
	end

	it 'is shown an authentication failed notice if cannot authenticate with twitter.' do
		OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
		visit root_path
		click_link "Sign in with Twitter"
		expect(page).to have_content("Authentication with Twitter has failed")
	end
end
