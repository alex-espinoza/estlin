class User < ActiveRecord::Base
	attr_accessible :uid, :nickname

	validates_presence_of :uid
  validates_presence_of :nickname

  def self.from_omniauth(auth)
  	User.where(auth.slice("uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.uid = auth["uid"]
  		user.nickname = auth["info"]["nickname"]
  	end
  end
end
