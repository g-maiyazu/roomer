FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:user_name) { |n| "tester#{n}" }
    sequence(:email)     { |n| "tester#{n}@example.com" }
    password             { 'password' }
  end

  trait :invalid do
    user_name { '' }
    email     { 'tester@invalid' }
    password  { 'test' }
  end
end
