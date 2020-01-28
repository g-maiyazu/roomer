require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  it '有効なファクトリを持つこと' do
    expect(FactoryBot.build(:profile)).to be_valid
  end

  describe '文字数の検証' do
    it '名前が50文字以内なら有効であること' do
      @profile.name = 'a' * 50
      expect(@profile).to be_valid
    end

    it '名前が50文字を越えるなら無効であること' do
      @profile.name = 'a' * 51
      @profile.valid?
      expect(@profile.errors).to be_added(:name, :too_long, count: 50)
    end

    it '自己紹介が140文字以内なら有効であること' do
      @profile.introduction = 'a' * 140
      expect(@profile).to be_valid
    end

    it '自己紹介が140文字を越えるなら無効であること' do
      @profile.introduction = 'a' * 141
      @profile.valid?
      expect(@profile.errors).to be_added(:introduction, :too_long, count: 140)
    end

    it '都道府県が70文字以内なら有効であること' do
      @profile.address = 'a' * 70
      expect(@profile).to be_valid
    end

    it '都道府県が70文字を越えるなら無効であること' do
      @profile.address = 'a' * 71
      @profile.valid?
      expect(@profile.errors).to be_added(:address, :too_long, count: 70)
    end

    it '広さが30文字以内なら有効であること' do
      @profile.floor_width = 'a' * 30
      expect(@profile).to be_valid
    end

    it '広さが70文字を越えるなら無効であること' do
      @profile.floor_width = 'a' * 31
      @profile.valid?
      expect(@profile.errors).to be_added(:floor_width, :too_long, count: 30)
    end

    it 'ウェブサイトが30文字以内なら有効であること' do
      @profile.web_site = 'a' * 50
      expect(@profile).to be_valid
    end

    it 'ウェブサイトが70文字を越えるなら無効であること' do
      @profile.web_site = 'a' * 51
      @profile.valid?
      expect(@profile.errors).to be_added(:web_site, :too_long, count: 50)
    end
  end
end
