require 'spec_helper'

describe Tweet do
  describe 'Estlin' do
	 	it 'reads the text file which it gets its tweets from.' do
	 		File.open("./test.txt", "r").each_line do |line|
	 			tweet = line
	 		end
	 		expect(tweet).to eq("This is the latest test tweet.")
		end
 	end
end
