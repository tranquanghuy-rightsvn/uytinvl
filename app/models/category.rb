class Category < ApplicationRecord
  has_many :posts
  validates :name, presence: true

  def self.generate_options
    pluck(:name, :id)
  end
end
