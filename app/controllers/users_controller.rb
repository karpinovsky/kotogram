class UsersController < ApplicationController
  def show
    @user = User.find_by(login: params[:login])
  end

  def feed
  end
end
