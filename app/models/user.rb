class User < ActiveRecord::Base
	attr_accessible :uid, :nickname

  has_many :tweets,
    inverse_of: :user

	validates_presence_of :uid
  validates_presence_of :nickname
  validates_presence_of :oauth_token
  validates_presence_of :oauth_secret

  def self.from_omniauth(auth)
  	user = User.where(auth.slice("uid")).first || create_from_omniauth(auth)
    # Below if statement is in case the user's tokens ever change, update them when logging in so we always have most recent
    if user.oauth_token != auth["credentials"]["token"] || user.oauth_token != auth["credentials"]["secret"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_secret = auth["credentials"]["secret"]
      user.save!
    end
    user
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.uid = auth["uid"]
  		user.nickname = auth["info"]["nickname"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_secret = auth["credentials"]["secret"]
  	end
  end
end
