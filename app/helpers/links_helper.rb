module LinksHelper
  def with_links_to_users(body)
    body.gsub(/@\w+/){|link| link_to link, user_path("#{link.delete('@')}")}.html_safe
  end
end
