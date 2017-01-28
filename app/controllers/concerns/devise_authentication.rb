module Concerns
  module DeviseAuthentication
    extend ActiveSupport::Concern
    included do
      helper_method :resource_name, :resource, :devise_mapping
    end

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end
end
