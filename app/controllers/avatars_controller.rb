class AvatarsController < ApplicationController
  def create
    @avatar = Avatar.create!(avatar_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.avatar.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def avatar_params
    params.require(:avatar).permit(:id, :user_id, :avatar)
  end
end
