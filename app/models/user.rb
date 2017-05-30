class User < ApplicationRecord
  scope :search, ->(search) { where('profile.username LIKE ?', "%#{search}%") }

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  validates_associated :profile

  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships
  has_many :posts, dependent: :destroy


  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :omniauthable, :omniauth_providers => [:facebook]


  validates_associated :posts

  def to_param
    profile.username
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
      user.save!

      Profile.create(
        user: user,
        username: auth.info.first_name + auth.info.last_name,
        full_name: auth.info.first_name + ' ' +  auth.info.last_name,
        remote_avatar_url: auth.info.image)
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
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
