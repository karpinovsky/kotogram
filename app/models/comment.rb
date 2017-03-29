class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :commenter, :body, presence: true,
    unless: Proc.new { |a| a.post.nil? }
  #after_create do
  #  comment = Comment.find(self.id)
  #  post = comment.post
  #  hashtags = self.body.scan(/#\w+/)
  #  hashtags.uniq.map do |hashtag|
  #    tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
  #    post.tags << tag
  #  end
  #end
end
