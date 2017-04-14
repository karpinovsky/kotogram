module CommentsHelper
  def commenter_username(commenter_id)
    Profile.find(commenter_id).username
  end
end
