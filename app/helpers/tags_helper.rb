module TagsHelper
  def with_links_to_tags(body)
    body.gsub(/#\w+/) { |tag| link_to tag, tag_path(tag.delete('#')) }.html_safe
  end
end
