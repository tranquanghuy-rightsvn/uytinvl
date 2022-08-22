# frozen_string_literal: true

module NotificationHelper
  def current_tab tab
    params_tab = params[:tab] || "all"
    params_tab == tab ? "current-tab" : ""
  end
end
