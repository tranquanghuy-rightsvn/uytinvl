class NotificationService
  attr_accessor :from_user, :to_user, :channel, :post, :comment, :group, :key

  def initialize **args
    @from_user = args[:from_user]
    @to_user = args[:to_user]
    @channel = args[:channel]
    @post = args[:post]
    @comment = args[:comment]
    @group = args[:group]
    @key = args[:key]
  end

  def perform
    case key
    when "invite_channel"
      Notification.create to_user_id: to_user.id, from_user_id: from_user.id,
        channel_id: channel.id, key: key
    when "comment_post"
      ActiveRecor::Base.transaction do
        notification = Notification.find_or_create_by! to_user_id: to_user.id, post_id: post.id, key: key
        notification.update from_user_id: from_user.id, created_at: Time.current
        notification.notification_group_users.find_or_create_by!(user_id: from_user.id)
      end
    when "welcome"
      Notification.create! to_user_id: to_user.id, key: key
    end
  end
end
