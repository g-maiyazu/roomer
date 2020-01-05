require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.create(:post) }

  it '有効なファクトリを持つこと' do
    expect(post).to be_valid
  end

  it 'ユーザー、画像があれば有効な状態であること' do
    user = FactoryBot.create(:user)
    post = Post.new(
      image: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/room.png')),
      user: user
    )
    expect(post).to be_valid
  end
end
