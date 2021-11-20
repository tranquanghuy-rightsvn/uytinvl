class UsersChannel < ApplicationRecord
	belongs_to :channel
	validates :role, presence: true
	enum role: { editor: 0, admin: 1 }
end