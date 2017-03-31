class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def home
    @feed_items = current_user.feed.order('created_at DESC')
  end

  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def following
  end

  def followers
  end
end
