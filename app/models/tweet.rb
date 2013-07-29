class Tweet < ActiveRecord::Base
  attr_accessible :text, :scheduled_time, :was_tweeted

  belongs_to :user

  validates_presence_of :text
  validates_presence_of :scheduled_time
  validates_presence_of :was_tweeted
  validates_length_of :text, :minimum => 1, :maximum => 140
end
