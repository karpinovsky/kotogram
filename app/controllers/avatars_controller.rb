class AvatarsController < ApplicationController
  def create
    @avatar = Avatar.create!(avatar_params)
  end

  private

  def avatar_params
    params.require(:avatar).permit(:user_id, :avatar)
  end
end
