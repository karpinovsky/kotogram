class UsersController < ApplicationController
  include Concerns::UserByLogin
  include Concerns::CurrentUser

  def index
    @users = User.search(params[:search])
  end

  def show
    @images = user_by_login.images.all.order('created_at DESC')
  end

  def feed
    @feed_items = current_user.feed
  end

  def following
    # users followed by user
  end

  def followers
    # user's followers
  end
end
