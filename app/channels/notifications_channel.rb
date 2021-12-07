class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:29"
  end

  def unsubscribed
    stop_all_streams
  end
end
