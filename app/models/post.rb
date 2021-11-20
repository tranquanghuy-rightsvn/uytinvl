class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :channel, optional: true
	has_many :tags_posts

	validates :title, presence: true
	validates :content, presence: true
	validate :count_within_limit, :on => :create

  def count_within_limit
    if self.tags_posts.count >= 3
      errors.add(:base, "Exceeded thing limit")
    end
  end
end
