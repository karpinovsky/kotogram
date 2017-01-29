class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true, length: { maximum: 250 }
end
