class Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      build_resource({})
      resource.build_profile
      yield resource if block_given?
      respond_with resource
    end

    protected

    def after_inactive_sign_up_path_for(_)
      new_registration_path(resource_name)
    end
  end
end
