class Tweet < ActiveRecord::Base
  attr_accessible :text

  def open_tweet_file
  	filepath = "#{Rails.root}/app/models/test.txt"
		File.open(filepath, "r").each_line do |line|
 			puts line
 		end
  end
end
