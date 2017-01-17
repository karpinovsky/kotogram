class UsersController < ApplicationController
  include Concerns::UserByLogin

  def index
    @users = User.search(params[:login])
  end

  def show
    @images = user_by_login.images.all.order('created_at DESC')
  end

  def feed
  end

  private

  def search_params
    params.require(:user).permit(:login)
  end
end
