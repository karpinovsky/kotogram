class AvatarsController < ApplicationController

  def create
    Avatar.create(avatar_params)
    redirect_to current_user
  end

  def destroy
    current_user.avatar.destroy
    redirect_to current_user
  end

  def update
    current_user.avatar.update_attributes(avatar_params)
    redirect_to current_user
  end

  private

  def avatar_params
    params.require(:avatar).permit(:id, :user_id, :avatar)
  end
end
