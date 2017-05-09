class UsersController < ApplicationController
  include Concerns::UserByProfileUsername
  skip_before_action :authenticate_user!, only: [:show]
  respond_to :html, :js

  def feed
    @feed_items = current_user.feed.order('created_at DESC')
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
