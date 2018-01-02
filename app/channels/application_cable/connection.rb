module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      current_user = User.find(cookies.signed['user.id'])
      expiration = cookies.signed['user.expires_at']
      if current_user && expiration > Time.zone.now
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
