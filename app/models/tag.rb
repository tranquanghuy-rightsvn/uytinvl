class Tag < ApplicationRecord
	has_many :tags_posts
	has_many :posts, through: :tags_posts
	validates :name, presence: true, uniqueness: true
end
