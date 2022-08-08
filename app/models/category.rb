class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true

  def self.generate_options
    pluck(:name, :id)
  end
end
