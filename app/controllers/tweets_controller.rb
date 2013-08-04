class TweetsController < ApplicationController
  def index
  	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(params[:tweet])
  	@tweet.user = current_user

    respond_to do |format|
    	if @tweet.save
        @tweet.tweet_at_scheduled_time
        flash[:notice] = "Tweet has been scheduled"
        format.html { render 'index' }
        format.js
    	else
    		format.html { render 'index' }
        format.js { render 'reload' }
    	end
    end
  end
end
