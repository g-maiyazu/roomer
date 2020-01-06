FactoryBot.define do
  factory :comment do
    content { 'いい部屋ですね' }
    association :post
    association :user
  end
end
