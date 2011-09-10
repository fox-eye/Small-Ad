module ApplicationHelper
  def title
    default_title = "Small ad"
    if @title.nil?
      default_title
    else
      default_title + " | #{@title}"
    end   
  end
end
