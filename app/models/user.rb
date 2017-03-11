class User < ApplicationRecord
  scope :search, ->(search) { where('username LIKE ?', "%#{search}%") }
  has_many :posts
  has_one  :avatar, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships
  before_save { username.downcase! }
  accepts_nested_attributes_for :avatar
  VALID_USERNAME_REGEX = /\A(^[a-zA-Z])\w*([a-zA-Z]|\d)$\z/i
  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX },
                    length: { minimum: 5, maximum: 20 },
                    uniqueness: { case_sensitive: false }

  accepts_nested_attributes_for :avatar

  devise :omniauthable, :omniauth_providers => [:facebook]

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name + ' ' + auth.info.last_name
      user.username = auth.info.first_name + auth.info.last_name
      user.skip_confirmation!
    end

    user.avatar = Avatar.create!(user: user, remote_avatar_url: auth.info.image.gsub('http://','https://'))
    user
  end

  def facebook_avatar
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def to_param
    username
  end

  def feed
    Post.from_users_followed_by(self)
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
