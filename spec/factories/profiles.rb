FactoryBot.define do
  factory :profile do
    sequence(:name) { |n| "foobar#{n}" }
    age { '25' }
    gender { :man }
    job { :it }
    address { '東京都' }
    living_style { :alone }
    floor_plan { :one_R }
    floor_width { '25㎡' }
    web_site { 'tester.com' }
    introduction { 'モノトーンな部屋が好きです' }

    association :user
  end
end
