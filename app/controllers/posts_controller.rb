class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create!(post_params)
    redirect_to current_user
  end

  def tags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :user_username, :description, image_attributes: [:image])
  end
end
