class UsersChannel < ApplicationRecord
	belongs_to :channel
	belongs_to :user
	validates :role, presence: true
	enum role: { editor: 0, admin: 1 }
end
