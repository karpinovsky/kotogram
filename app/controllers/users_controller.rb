class UsersController < ApplicationController
  include Concerns::UserByLogin

  def index
    @users = User.search(params[:search])
  end

  def show
    @images = user_by_login.images.all.order('created_at DESC')
  end

  def feed
    # user's feed
  end
end
