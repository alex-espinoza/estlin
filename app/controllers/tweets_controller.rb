class TweetsController < ApplicationController
  def index
  	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(params[:tweet])
  	@tweet.user = current_user

  	if @tweet.save
      @tweet.tweet_at_scheduled_time
  		redirect_to root_path, notice: "Tweet has been scheduled"
  	else
  		render action: "index"
  	end
  end
end
