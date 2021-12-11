class Comment < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :user
  belongs_to :parent_comment, class_name: "Comment", foreign_key: "parent_comment_id",
    optional: true
  has_many :sub_comments, class_name: "Comment", foreign_key: "parent_comment_id"

  validates :content, presence: true

  scope :newest, ->{ order created_at: :desc }
  scope :get_parents, ->{ where parent_comment_id: nil }
end
