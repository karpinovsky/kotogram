class Post < ApplicationRecord
  scope :by_date, -> { order(created_at: :desc) }

  belongs_to :user

  has_one :attachment, dependent: :destroy
  accepts_nested_attributes_for :attachment
  validates_associated :attachment

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  validates_associated :comments

  has_many :likes, as: :likeable, dependent: :destroy

  has_and_belongs_to_many :tags, dependent: :destroy
  validates_associated :tags

  validates :user_id, presence: true
  scope :from_users_followed_by, lambda { |user|
    followed_user_ids = 'SELECT followed_id FROM relationships WHERE follower_id = :user_id'
    where("user_id IN (#{followed_user_ids})", user_id: user.id)
  }

  def liked_by?(user)
    likes.find_by(liker: user.id)
  end
end
