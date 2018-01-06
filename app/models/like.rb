class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, counter_cache: true, inverse_of: :like
end
