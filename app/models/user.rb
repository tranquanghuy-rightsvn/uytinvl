class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :posts, dependent: :destroy
  has_many :channels, dependent: :destroy
  has_many :notifications, foreign_key: 'to_user_id', dependent: :destroy
  has_many :users_channels
  has_many :sub_channels, through: :users_channels, source: :channel

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: Settings.user.length_name.max }
  enum role: { user: 0, admin: 1 }

  def count_noti
    notifications.not_seen.count
  end

  def list_notification
    notifications.includes(:channel, :post, :from_user, :notification_group_users).newest
  end
end
