class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end
end
