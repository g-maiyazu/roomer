class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name,           presence: true,
                                  uniqueness: true,
                                  length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  # 検索メソッド
  def self.search(search)
    if search
      where(['user_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
