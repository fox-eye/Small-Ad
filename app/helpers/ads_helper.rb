module AdsHelper
  def admin_show_ad_img type
    if @ad.photo.content_type =~ /image/
      content_tag(:div, image_tag(@ad.photo.url(type)),:class => "pic-preview")
    end
  end
end
