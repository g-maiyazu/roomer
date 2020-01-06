class Profile < ApplicationRecord
  belongs_to :user

  validates :name,                length: { maximum: 50 },
                                  allow_blank: true
  validates :introduction,        length: { maximum: 140 },
                                  allow_blank: true
  validates :address,             length: { maximum: 70 },
                                  allow_blank: true
  validates :floor_width,         length: { maximum: 30 },
                                  allow_blank: true
  validates :web_site,            length: { maximum: 50 },
                                  allow_blank: true
  # 性別の種別管理
  enum gender: { man: 1, woman: 2, not_answer_gender: 3 }
  # 仕事の種別管理
  enum job: {
    housewife: 1, student: 2, interia: 3, architecher: 4, beauty: 5,
    fashon: 6, it: 7, other_job: 8, not_answer_job: 9
  }
  # 居住形態の種別管理
  enum living_style: {
    family: 1, alone: 2, share: 3, coupple: 4, other_style: 5, not_answer_style: 6
  }
  # 間取りの種別管理
  enum floor_plan: {
    one_R: 1, one_K: 2, one_DK: 3, one_LDK: 4,
    two_K: 5, two_DK: 6, two_LDK: 7, other_plan: 8, not_answer_plan: 9
  }
end
