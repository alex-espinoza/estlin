class TweetsController < ApplicationController
  def index
  	@tweet = Tweet.new
  end

end
