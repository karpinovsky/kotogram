module CommentsHelper
  def commenter_username(commenter_id)
    @commenter = User.find(commenter_id).username
  end
end
