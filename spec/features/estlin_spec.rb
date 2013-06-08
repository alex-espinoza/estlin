require 'spec_helper'

 describe 'Estlin' do
 	it 'has the latest tweet on the timeline' do
 		visit "https://twitter.com/requiestolar"
 		expect(page).to have_content("ANDJKJNSKJDNFK")
 	end
 end