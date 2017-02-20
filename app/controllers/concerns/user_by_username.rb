module Concerns
  module UserByUsername
    extend ActiveSupport::Concern
    included do
      helper_method :user_by_username
    end

    def user_by_username
      @user_by_username ||= ::User.find_by(username: params[:username])
    end
  end
end
