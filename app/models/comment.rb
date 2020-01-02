class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, length: { maximum: 140 }, presence: true
end
