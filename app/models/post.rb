class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  has_rich_text :content

  belongs_to :user
  belongs_to :category
  belongs_to :channel, optional: true

  has_many :tags_posts
  has_many :tags, through: :tags_posts
  has_many :comments, as: :resource

  validates :title, presence: true
  validates :image, presence: true
  validate :rich_text_content_presence
  validate :channel_must_belongs_to_user, if: -> { channel_id.present? }

  scope :newest, -> { order(created_at: :desc) }

  def rich_text_content_presence
    return if rich_text_content.body.to_s.length > Settings.rich_text_content.length_default

    errors.add(:rich_text_content, :blank)
  end

  def channel_must_belongs_to_user
    return if (user.channels.pluck(:id) + user.sub_channels.where(users_channels: { status: :accepted })
      .pluck(:id)).include?(channel_id)

    errors.add(:channel_id, :invalid)
  end

  def tag_post
    tags.pluck(:name)
  end
end
