class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_profile
    yield resource if block_given?
    respond_with resource
  end
end
