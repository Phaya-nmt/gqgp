class TweetsController < ApplicationController
  before_action :twtter_client, except: :new
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "qrJMGqvH8dlZk2MpedwZw3YPd"
      config.consumer_secret = "Cr8GqJrYzSJp6NVJmYttBxqjnC0IUdKnHrtaPgzxrW1Gf5LvEd"
      config.access_token = "gq_gp"
      config.access_token_secret = "4726906838"
    end
  end
  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:tweet).permit(:text, :image)
  end
  def post
  tweet = Tweet.order('rand()').first
  status = tweet.text
  media = open(tweet.image)
  @client.update_with_media(status, media)
  redirect_to :root
  end
end
