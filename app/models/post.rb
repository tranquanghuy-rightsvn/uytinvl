class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :channel, optional: true

	has_many :tags_posts
	has_many :tags, through: :tags_posts

	validates :title, presence: true
	validates :content, presence: true
end
