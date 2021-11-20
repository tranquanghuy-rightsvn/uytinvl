class Channel < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :users_channels
  has_many :members, through: "users_channels", foreign_key: "user_id"
  belongs_to :user
  validates :name, presence: true, length: { maximum: Settings.user.length_name.max}
end