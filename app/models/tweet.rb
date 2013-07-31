class Tweet < ActiveRecord::Base
  attr_accessible :text, :scheduled_time, :was_tweeted, :user_id

  belongs_to :user

  validates_presence_of :text
  validates_presence_of :scheduled_time
  validates_presence_of :user_id
  validates_length_of :text, :minimum => 1, :maximum => 140
  validate :scheduled_time_is_in_future

  def tweet_at_scheduled_time
    twitter_user = Twitter::Client.new(
      :oauth_token => self.user.oauth_token,
      :oauth_token_secret => self.user.oauth_secret
    )
    Thread.new{ twitter_user.update(self.text) }
    self.update_attribute(:was_tweeted, true)
  end

  handle_asynchronously :tweet_at_scheduled_time, :run_at => Proc.new { |t| t.scheduled_time }

private

  def scheduled_time_is_in_future
    errors.add :scheduled_time, "must be a time in the future." if scheduled_time < Time.now
  end
end
