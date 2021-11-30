class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  has_rich_text :content

  belongs_to :user
  belongs_to :category
  belongs_to :channel, optional: true

  has_many :tags_posts
  has_many :tags, through: :tags_posts

  validates :title, presence: true
  validates :image, presence: true
  validate :rich_text_content_presence
  scope :newest, -> { order(created_at: :desc) }

  def rich_text_content_presence
    return if rich_text_content.body.to_s.length > Settings.rich_text_content.length_default

    errors.add(:rich_text_content, :blank)
  end
end
