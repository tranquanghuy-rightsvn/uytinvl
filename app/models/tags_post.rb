class TagsPost < ApplicationRecord
	belongs_to :post
	belongs_to :tag

	validates :tag_id, uniqueness: { scope: :post_id }
	validate :count_within_limit


  def count_within_limit
    return if post.blank?
    return unless post.tags.count >= Settings.tag.limit

    errors.add(:post_id, I18n.t("errors.maximum_tag_limit"))
  end
end
