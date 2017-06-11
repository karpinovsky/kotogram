class UsersController < ApplicationController
  include Concerns::UserByProfileUsername
  skip_before_action :authenticate_user!, only: [:show]

  def home
    @feed_items = current_user.feed.order('created_at DESC')
    @recent_users = User.last(3).reverse
  end

  def show
    render "users/show/show"
  end
end
