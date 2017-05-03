module Concerns
  module UserByProfileUsername
    extend ActiveSupport::Concern
    included do
      helper_method :user_by_profile_username
    end

    def user_by_profile_username
      if @profile_by_username =|| ::Profile.find_by_username(params[:username])
        @user_by_profile_username ||= ::User.find(@profile.user_id)
      else
        fail ActiveRecord::RecordNotFound
      end
    end
  end
end
