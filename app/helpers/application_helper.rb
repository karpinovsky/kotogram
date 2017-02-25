module ApplicationHelper

  def with_links_to_tags(body)
    body.gsub(/#\w+/){|tag| link_to tag, tag_path("#{tag.delete('#')}")}.html_safe
  end

  def with_links_to_users(body)
    body.gsub(/@\w+/){|link| link_to link, user_path("#{link.delete('@')}")}.html_safe
  end
end
