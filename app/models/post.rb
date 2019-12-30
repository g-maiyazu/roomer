class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :image, presence: true
  validates :caption, length: { maximum: 140 }
  validates :user_id, presence: true

  # 検索メソッド
  def self.search(search)
    if search
      where(['caption LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
