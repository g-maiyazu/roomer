FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/room.png')) }
    caption { '今、住んでいる部屋です。白を基調としたインテリアで揃えています。' }
    association :user
  end
end
