class CommentsController < ApplicationController
  include Concerns::UserByUsername

  def create
    @comment = Comment.create!(comment_params)
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :post_id, :user_username, :body)
  end
end
