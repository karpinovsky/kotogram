class PostsController < ApplicationController
  def create
    @post = Post.create!(post_params)
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :body, image_attributes: [:image])
  end
end
