module DeviseHelper
  def devise_error_messages!
    flash.now[:error] = resource.errors.full_messages.first if resource.errors.any?
  end
end
