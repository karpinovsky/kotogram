class StaticPagesController < ApplicationController
  include Concerns::DeviseAuthentication
  include Concerns::UserByLogin
  include Concerns::CurrentUser

  def home
    signed_in? && @feed_items = current_user.feed.order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
    render 'static_pages/home/home'
  end
end
