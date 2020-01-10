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

  describe '存在性の検証' do
    it '写真がなければ無効な状態であること' do
      post.image = nil
      post.valid?
      expect(post.errors).to be_added(:image, :blank)
    end

    it 'ユーザーがなければ無効な状態であること' do
      post.user = nil
      post.valid?
      expect(post.errors).to be_added(:user, :blank)
    end
  end

  describe '文字数の検証' do
    it 'キャプションが140文字以内の場合、有効であること' do
      post.caption = 'a' * 140
      expect(post).to be_valid
    end

    it 'キャプションが140文字を越える場合、無効であること' do
      post.caption = 'a' * 141
      post.valid?
      expect(post.errors).to be_added(:caption, :too_long, count: 140)
    end
  end
end
