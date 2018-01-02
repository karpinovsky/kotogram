class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :user_id, :user_username, :body, presence: true

  has_many :likes, as: :likeable, dependent: :destroy

  def liked_by?(user)
    likes.find_by(liker: user.id)
  end

  after_create do
    hashtags = body.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(body: hashtag.downcase.delete('#'))
      post.tags << tag
    end
    Tag.reindex
  end

  after_save -> { CommentRelayJob.perform_later self }
end
