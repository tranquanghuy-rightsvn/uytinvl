class Channel < ApplicationRecord
  mount_uploader :avatar, ChannelAvatarUploader
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :posts, dependent: :destroy
  has_many :users_channels
  has_many :members, through: :users_channels, source: :user

  validates :name, presence: true, length: { maximum: Settings.channel.length_name.max}
end
