class User < ApplicationRecord
  scope :search, ->(search) { where('username LIKE ?', "%#{search}%") }
  has_many :posts
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships
  before_save { username.downcase! }
  VALID_USERNAME_REGEX = /\A(^[a-zA-Z])\w*([a-zA-Z]|\d)$\z/i
  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX },
                    length: { minimum: 5, maximum: 20 },
                    uniqueness: { case_sensitive: false }

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def to_param
    username
  end

  def feed
    Image.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end
end
