class UsersController < ApplicationController
  def show
    @user = User.find_by(login: params[:id])
  end

  def feed
  end
end
