class LikesController < ApplicationController
  def create
    @like = Like.create! like_params
    redirect_back(fallback_location: authenticated_root_path)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id, :liker)
    end
end
