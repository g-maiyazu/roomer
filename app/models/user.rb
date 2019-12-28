class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :user_name,           presence: true,
                                  uniqueness: true,
                                  length: { maximum: 20 }
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
end
