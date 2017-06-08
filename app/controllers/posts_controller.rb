class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :tags]

  def show
    @post = Post.find(params[:id])
  end

  def create
    current_user.posts.create!(post_params)
    redirect_back(fallback_location: authenticated_root_path)
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    redirect_to current_user
  end

  def tags
    @tag = Tag.find_by(body: params[:body])
    @posts = @tag.posts
    @top_posts = @tag.posts.order(likes_count: :desc).take(9)
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :description, attachment_attributes: [:media])
  end
end
