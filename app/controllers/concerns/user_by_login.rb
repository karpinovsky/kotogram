module Concerns
  module UserByLogin
    extend ActiveSupport::Concern
    included do
      helper_method :user_by_login
    end

    def user_by_login
      @user_by_login ||= ::User.find_by(login: params[:login])
    end
  end
end
