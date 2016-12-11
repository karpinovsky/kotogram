class User < ApplicationRecord

  # Include devise modules
  devise :database_authenticatable, # for users authentification
         :registerable,             # for registration, edit, destroy users
         :recoverable,              # for password recovery
         :rememberable,             # for remembering users by cookies
         :trackable,                # for statistics
         :validatable,              # for validating users
         :confirmable               # for confirming registration

  def to_param
    login
  end
end
