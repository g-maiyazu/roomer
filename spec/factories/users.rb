FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "tester#{n}" }
    sequence(:email)     { |n| "tester#{n}@example.com" }
    password             { 'password' }
    confirmed_at { Date.today }
  end
end
