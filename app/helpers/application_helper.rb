module ApplicationHelper
  def title
    default_title = "Small ad - search for small ads with tiny efforts"
    if @title.nil?
      default_title
    else
      default_title + "| #{@title}"
    end   
  end
end
