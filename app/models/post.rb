class Post < ApplicationRecord
  belongs_to :user
  has_one :image
  accepts_nested_attributes_for :image
end
