class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(request.env['omniauth.auth'])
  	session[:user_id] = user.id
  	redirect_to root_path, notice: "You have signed in as '#{user.nickname}'"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "You have been signed out"
  end

  def failed
  	redirect_to root_path, notice: "Authentication with Twitter has failed."
  end
end
