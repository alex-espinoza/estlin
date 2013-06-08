require 'spec_helper'

 describe 'Estlin' do
 	it 'displays the latest line of text it has tweeted.' do
 		visit "/"
 		expect(page).to have_content("This is the latest test tweet.")
 	end
 end