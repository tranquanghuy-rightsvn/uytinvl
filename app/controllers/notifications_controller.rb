class NotificationsController < ApplicationController
  before_action :check_current_user
  before_action :set_notification, only: :update

  def index
    if params[:tab].blank?
      @notifications = current_user.notifications.newest.page(params[:page]).per(20)
    elsif params[:tab] == "unread"
      @notifications = current_user.notifications.not_seen.newest.page(params[:page]).per(20)
    else
      redirect_to notifications_path
    end
  end

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

  def mark_as_read_all
    current_user.notifications.not_seen.each do |noti|
      noti.update seen: true
    end

    redirect_to notifications_path
  end

  private

  def set_notification
    @noti = Notification.find_by(id: params[:id])
    redirect_to root_path unless @noti
  end
end

