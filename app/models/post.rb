class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

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

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    liked_users.include?(user)
  end
end
