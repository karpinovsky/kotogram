class CommentsController < ApplicationController

  def create
    comment = Post.find(params[:post_id]).comments.create comment_params
    if comment.save
      ActionCable.server.broadcast 'comment_channel',
        comment: render(partial: "comment", locals: { comment: comment }),
        post: comment.post_id
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :user_username, :body)
    end
end
