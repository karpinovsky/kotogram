class Profile < ApplicationRecord
  include AlgoliaSearch

  self.primary_key = 'user_id'

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
end
