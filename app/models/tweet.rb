class Tweet < ActiveRecord::Base
  attr_accessible :text, :scheduled_time, :was_tweeted, :user_id

  belongs_to :user

  validates_presence_of :text
  validates_presence_of :scheduled_time
  validates_presence_of :user_id
  validates_length_of :text, :minimum => 1, :maximum => 140
  validate :scheduled_time_is_in_future

private

  def scheduled_time_is_in_future
    errors.add :scheduled_time, "must be a time in the future." if scheduled_time < Time.now
  end
end
