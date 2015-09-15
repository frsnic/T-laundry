module ApplicationHelper

  def title_with_link(title, length, need_link, link)
    title = truncate(title, length: length)
    if need_link
      link_to(title, link)
    else
      title
    end
  end

end
