module ApplicationHelper
  def title
    default_title = "Small ad"
    if @title.nil?
    default_title
    else
      default_title + " | #{@title}"
    end
  end

  def show_categories categories
    out = ""
    categories.each do |category|
      if category.is_root?
        out += content_tag(:h2,category.name, :class => "category")
      else
        out += content_tag(:div,link_to(category.name,'#'), :class => "sub_category")
      end
    end
    out.html_safe
  end
end
