class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :commenter, :body)
  end
end
