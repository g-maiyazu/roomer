FactoryBot.define do
  factory :notification do
    visitor_id { 1 }
    visited_id { 1 }
    post_id { 1 }
    comment_id { 1 }
    action { "MyString" }
    checked { false }
  end
end
