class CommentsController < ApplicationController

  def create
    Post.find(params[:post_id]).comments.create comment_params
    redirect_back(fallback_location: authenticated_root_path)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :commenter, :body)
    end
end
