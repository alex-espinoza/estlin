require 'fileutils'
require 'tempfile'

class Tweet < ActiveRecord::Base
  attr_accessible :text
  validates_uniqueness_of :text

  attr_accessor :filepath, :tweet

  def get_status_from_file
  	@filepath = "#{Rails.root}/app/models/test.txt"
  	@tweet = ""
		File.open(@filepath, "r") do |line|
 			@tweet = line.readline.chomp
 		end
 		return @tweet
  end

  def delete_status_and_update_file(status)
  	temp_file = Tempfile.new("update")
  	File.foreach(@filepath) do |line|
  		temp_file << line unless line.chomp == status
  	end
  	temp_file.close
  	FileUtils.mv(temp_file.path, @filepath)
  	temp_file.unlink
  end

  def post_status
  	if @tweet != "" && @tweet != nil
  		Twitter.update(@tweet)
  		Tweet.create(:text => @tweet)
  		@tweet = ""
  	else
  		puts "ERROR: Status has not been updated due to tweet not being a string."
  	end
  end

end
