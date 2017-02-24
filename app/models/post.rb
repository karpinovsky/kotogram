class Post < ApplicationRecord
  belongs_to :user
  has_one :image
  accepts_nested_attributes_for :image
  has_many :comments
  accepts_nested_attributes_for :comments
  scope :from_users_followed_by, lambda { |user|
    followed_user_ids = 'SELECT followed_id FROM relationships WHERE follower_id = :user_id'
    where("user_id IN (#{followed_user_ids})", user_id: user.id)
  }
end