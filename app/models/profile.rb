class Profile < ApplicationRecord
  include AlgoliaSearch

  self.primary_key = 'user_id'

  before_update :set_new_username_to_comments, if: :username_changed?

  before_save { username.downcase! }

  belongs_to :user

  validates :username, presence: true, length: { within: 6..20 },
    uniqueness: { case_sensitive: false }

  validates :about_me, length: { maximum: 75 }

  mount_uploader :avatar, AvatarUploader

  algoliasearch per_environment: true do
    attribute :username, :full_name, :avatar

    searchableAttributes ['username', 'full_name']
  end

  def set_new_username_to_comments
    Comment.where(user_id: self.user.id).each do |comment|
      comment.update(user_username: self.username)
    end
  end
end
