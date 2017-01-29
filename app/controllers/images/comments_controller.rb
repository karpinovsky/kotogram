module Images
  class CommentsController < ::CommentsController
    private

    def set_commentable
      @commentable = Image.find(params[:image_id])
    end
  end
end
