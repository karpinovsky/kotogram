class Post < ApplicationRecord
  belongs_to :user
  has_one :image
  accepts_nested_attributes_for :image
  # has_one :video
  # accepts_nested_attributes_for :video
  # has_many :comments
  # accepts_nested_attributes_for :comments
  # has_many :likes
  # accepts_nested_attributes_for :likes
  # has_and_belongs_to_many :tags
  # accepts_nested_attributes_for :tags
end
