require 'fileutils'
require 'tempfile'

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

  def get_specific_tweet_from_file(line_num)
  	filepath = "#{Rails.root}/app/models/test2.txt"
  	status = ""
  	counter = 0
  	File.foreach(filepath) do |line|
  		counter += 1
  		if counter == line_num
  			status = line.chomp
  			break
  		end
  	end
  	if status != "" then return status else return "Error: That line doesn't exist." end
  end

  def get_tweet_and_delete_from_file(line_num)
  	temp_file = Tempfile.new("update")
  	filepath = "#{Rails.root}/app/models/test2.txt"
  	status = ""
  	counter = 0
  	File.foreach(filepath) do |line|
  		counter += 1
  		if counter == line_num
  			status = line.chomp
  			break
  		end
  	end
  	File.foreach(filepath) do |line|
  		temp_file << line unless line.chomp == status
  	end
  	temp_file.close
  	FileUtils.mv(temp_file.path, filepath)
  	if status != "" then return status else return "Error: That line doesn't exist." end
  end

  def read_text_file
  	filepath = "#{Rails.root}/app/models/test2.txt"
  	File.open(filepath, "r") do |f|
  		while line = f.gets
  			puts line
  		end
  	end
  end
end
