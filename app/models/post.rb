class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
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

  # お気に入り通知メソッド
  def create_notification_by(current_user)
    # すでにお気に入りされているか確認
    like_check = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # お気に入りされていない場合のみ、通知レコードを作成
    if like_check.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するお気に入りの場合は、通知済みとする
      notification.checked = true if notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
    end
  end
end
