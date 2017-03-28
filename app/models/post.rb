class Post < ApplicationRecord
  belongs_to :user

  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image
  validates_associated :image

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  validates_associated :comments

  validates :user_id, presence: true
  scope :from_users_followed_by, lambda { |user|
    followed_user_ids = 'SELECT followed_id FROM relationships WHERE follower_id = :user_id'
    where("user_id IN (#{followed_user_ids})", user_id: user.id)
  }

  before_save do
    comments.first.destroy if comments.first.body.blank?
  end
  #has_and_belongs_to_many :tags

end
