# frozen_string_literal: true

module ApplicationHelper
  def is_controller? controller_name
    controller_name == params[:controller] ? "active" : nil
  end
end
