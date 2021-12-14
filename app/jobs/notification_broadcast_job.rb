class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform notification
    ActionCable.server.broadcast "notifications:#{notification.to_user_id}",
      { 
        layout: render_notification([notification.to_user.list_notification.first])
      }
  end

  private

  def render_notification notifications
    ApplicationController.renderer.render(partial: "notifications/index",
      locals: {notifications: notifications})
  end
end
