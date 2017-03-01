class UsersController < ApplicationController
  include Concerns::UserByUsername
  include Concerns::CurrentUser

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
