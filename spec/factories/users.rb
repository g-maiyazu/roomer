FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "tester#{n}" }
    sequence(:email)     { |n| "tester#{n}@example.com" }
    password             { 'password' }
    confirmed_at         { Time.zone.today }

    trait :admin do
      user_name    { 'admin' }
      email        { 'admin@example.com' }
      password     { 'password' }
      admin        { true }
      confirmed_at { Time.zone.today }
    end
  end
end
