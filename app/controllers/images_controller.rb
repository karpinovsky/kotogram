class ImagesController < ApplicationController
  def create
    @image = current_user.images.build
    current_user.images.create!(image_params)
    redirect_to current_user
  end

  def destroy
    current_user.images.destroy(params[:id])
    redirect_to current_user
  end

  private

  def image_params
    params.require(:image).permit(:id, :user_id, :image)
  end
end
