class UsersController < ApplicationController
  include Concerns::UserByProfileUsername
  skip_before_action :authenticate_user!, only: [:show]
  respond_to :html, :js

  def home
    @feed_items = current_user.feed.order('created_at DESC')
  end

  def index
    @users = User.joins(:profile).where('username LIKE ? ', "%#{params[:search]}%")
  end

  def show
  end

  def following
  end

  def followers
  end
end
