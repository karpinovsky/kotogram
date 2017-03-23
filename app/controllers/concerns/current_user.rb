module Concerns
  module CurrentUser
    extend ActiveSupport::Concern
    included do
      helper_method :current_user?
    end

    def current_user?(user_by_username)
      current_user == user_by_username
    end
  end
end
