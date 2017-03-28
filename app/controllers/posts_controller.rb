class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :tags]

  def show
    @post = Post.find(params[:id])
  end

  def create
    current_user.posts.create!(post_params)
    redirect_back(fallback_location: authenticated_root_path)
  end

  def tags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, image_attributes: [:image])
  end
end
