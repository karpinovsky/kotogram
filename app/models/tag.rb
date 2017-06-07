class Tag < ApplicationRecord
  include AlgoliaSearch

  has_and_belongs_to_many :posts

  validates :body, presence: true

  algoliasearch do
    attribute :body
  end
end
