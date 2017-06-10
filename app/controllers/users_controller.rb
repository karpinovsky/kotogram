class UsersController < ApplicationController
  include Concerns::UserByProfileUsername
  skip_before_action :authenticate_user!, only: [:show]

  def home
    @feed_items = current_user.feed.order('created_at DESC')
  end

  def show
    render "users/show/show"
  end
end
