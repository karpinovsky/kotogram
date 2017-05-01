class ProfilesController < ApplicationController
  def update
    if current_user.profile.update profile_params
      flash[:success] = 'Your profile has been successfully updated!'
    else
      flash[:error] = current_user.profile.errors.full_messages.first
    end
      redirect_back(fallback_location: authenticated_root_path)
  end

  private

    def profile_params
      params.require(:profile).permit(:username, :full_name, :about_me, :avatar, :avatar_cache, :remove_avatar)
    end
end
