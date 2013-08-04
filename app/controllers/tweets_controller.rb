class TweetsController < ApplicationController
  def index
  	@tweet = Tweet.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  	@tweet = Tweet.new(params[:tweet])
  	@tweet.user = current_user

    respond_to do |format|
    	if @tweet.save
        @tweet.tweet_at_scheduled_time
        format.html { render 'index' }
        format.js
    	else
    		format.html { render 'index' }
        format.js { render 'reload' }
    	end
    end
  end
end
