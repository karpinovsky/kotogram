module Concerns
  module CurrentUser
    extend ActiveSupport::Concern
    included do
      helper_method :current_user?
    end

    def current_user?(user)
      user == current_user
    end
  end
end
