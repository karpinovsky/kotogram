class UsersController < ApplicationController
  include Concerns::UserByUsername
  include Concerns::CurrentUser
  skip_before_action :authenticate_user!, only: [:show]

  def home
    #@feed_items = current_user.feed.order('created_at DESC')
  end

  def index
    @users = User.search(params[:search])
  end

  def show
  end

  def following
  end

  def followers
  end
end
