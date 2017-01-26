class User < ApplicationRecord
  scope :search, ->(search) { where('login LIKE ?', "%#{search}%") }
  has_many :images
  accepts_nested_attributes_for :images
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships
  before_save { login.downcase! }
  VALID_NAME_REGEX  = /\A^[a-zA-Z]+$\z/i
  VALID_LOGIN_REGEX = /\A(^[a-zA-Z])\w*([a-zA-Z]|\d)$\z/i
  validates :name,  presence: true, format: { with: VALID_NAME_REGEX },
                    length: { minimum: 2 }
  validates :login, presence: true, format: { with: VALID_LOGIN_REGEX },
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
    login
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
