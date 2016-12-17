class User < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
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

  def self.search(login)
    where('name LIKE ?', "%#{login}%")
  end
end
