module Concerns
  module UserByUsername
    extend ActiveSupport::Concern
    included do
      helper_method :user_by_username
    end

    def user_by_username
      @user_by_username ||= ::User.find(::Profile.find_by(
        user_username: params[:user_username]).user_id)
    end
  end
end
