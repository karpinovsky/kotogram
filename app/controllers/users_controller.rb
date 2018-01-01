class UsersController < ApplicationController
  include Concerns::UserByProfileUsername
  skip_before_action :authenticate_user!, only: [:show]

  def home
    @feed_items = current_user.feed.order('created_at DESC')
    render 'users/home/home'
  end

  def show
    render "users/show/show"
  end
end
