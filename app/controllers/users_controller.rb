class UsersController < ApplicationController
  include Concerns::UserByProfileUsername

  skip_before_action :authenticate_user!, only: [:show]

  def feed
    @feed_items = current_user.feed.order('created_at DESC')
  end

  def index
    @users = User.search(params[:search])
  end

  def show
    if @profile = Profile.find_by_username(params[:username])
      @user = User.find(@profile.user_id)
    else
      fail ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    if @profile = Profile.find_by_username(params[:username])
      @user = User.find(@profile.user_id)
    else
      fail ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def followers
    if @profile = Profile.find_by_username(params[:username])
      @user = User.find(@profile.user_id)
    else
      fail ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
