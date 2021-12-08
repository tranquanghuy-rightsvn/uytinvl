class UsersChannel < ApplicationRecord
	belongs_to :channel
	belongs_to :user
	validates :role, presence: true
	enum role: { editor: 0, admin: 1 }
	enum status: { waiting: 0, rejected: 1, accepted: 2 }
end
