FactoryBot.define do
  factory :profile do
    name { "MyString" }
    age { 1 }
    gender { 1 }
    job { 1 }
    address { "MyString" }
    living_style { 1 }
    floor_plan { 1 }
    floor_width { "MyString" }
    web_site { "MyString" }
    introduction { "MyText" }
    user_id { 1 }
    user { nil }
  end
end
