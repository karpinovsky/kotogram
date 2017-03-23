class UserProfile < ApplicationRecord
  self.table_name = 'profiles_to_users'
  belongs_to :user
end
