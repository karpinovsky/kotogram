class UsersController < ApplicationController
  def index
    @users = User.search(params[:login])
  end

  def show
    @user = User.find_by(login: params[:login])
  end

  def feed
  end

  private

  def search_params
    params.require(:user).permit(:login)
  end
end
