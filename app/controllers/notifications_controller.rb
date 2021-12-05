class NotificationsController < ApplicationController
  before_action :check_current_user
  before_action :set_notification

  def update
    unless @noti.seen
      @noti.update seen: true
    end

    case @noti.key
    when "invite_channel"
      redirect_to @noti.channel
    when "comment_post"
      redirect_to @noti.post
    when "welcome"
      redirect_to root_path
    end
  end

  private

  def set_notification
    @noti = Notification.find_by(id: params[:id])
    redirect_to root_path unless @noti
  end
end

