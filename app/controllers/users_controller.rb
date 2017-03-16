class UsersController < ApplicationController
  include Concerns::UserByUsername
  include Concerns::CurrentUser
  before_action :authenticate_user!, except: [:show]

  def home
    @feed_items = current_user.feed.order('created_at DESC')
  end

  def index
    @users = User.search(params[:search])
  end

  def show
  end

  def update
    current_user.update_attributes(user_params)
  end

  def following
  end

  def followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :website, :bio, :email, :phone, :gender)
  end
end
