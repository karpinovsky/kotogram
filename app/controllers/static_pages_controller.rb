class StaticPagesController < ApplicationController
  include Concerns::DeviseAuthentication
  include Concerns::UserByUsername
  include Concerns::CurrentUser

  def home
    signed_in?
    respond_to do |format|
      format.html
      format.js
    end
    render 'static_pages/home/home'
  end
end
