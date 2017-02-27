class Avatar < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :avatar,  presence: true
  validates :user_id, presence: true
end
