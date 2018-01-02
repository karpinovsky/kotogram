module Concerns
  module UserByProfileUsername
    extend ActiveSupport::Concern
    included do
      helper_method :user_by_profile_username
    end

    def user_by_profile_username
      user_profile = ::Profile.find_by(username: params[:username])
      raise ActiveRecord::RecordNotFound unless user_profile
      @user_by_profile_username ||= ::User.find(user_profile.user_id)
    end
  end
end
