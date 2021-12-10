# frozen_string_literal: true

module ApplicationHelper
  def is_controller? controller_name
    controller_name == params[:controller] ? "active" : nil
  end

  def current_user_count_noti
    return if current_user.count_noti == 0
    return "<div class='count-noti'><p> #{current_user.count_noti} </p></div>".html_safe if current_user.count_noti < 100

    "<div class='count-noti'><p> 99 </p></div>".html_safe
  end

  def avatar_of object
    return "<img src='#{object.avatar_url}' />".html_safe if object.avatar_url

    image_tag("avatar_#{object.class.to_s.downcase}_default.jpg")
  end
end
