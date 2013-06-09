class Tweet < ActiveRecord::Base
  attr_accessible :text
  validates_uniqueness_of :text

  def get_tweet_from_file
  	filepath = "#{Rails.root}/app/models/test.txt"
  	status = ""
		File.open(filepath, "r").each_line do |line|
 			status = line
 		end
 		return status
  end
end
