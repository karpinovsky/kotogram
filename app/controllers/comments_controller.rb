class CommentsController < ApplicationController
  include Concerns::UserByLogin

  def create
    authenticate_user!
    set_commentable
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_username)
  end
end
