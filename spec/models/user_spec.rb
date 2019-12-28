require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '有効なファクトリを持つこと' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'ユーザー名、メールアドレス、パスワードがあれば有効であること' do
    user = User.new(
      user_name: 'tester',
      email: 'tester@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  describe '存在の確認' do
    it 'ユーザー名が無効であること' do
      @user.user_name = nil
      @user.valid?
      expect(@user.errors).to be_added(:user_name, :blank)
    end

    it 'ユーザー名がなければ無効であること' do
      @user.user_name = nil
      @user.valid?
      expect(@user.errors).to be_added(:user_name, :blank)
    end

    it 'メールアドレスがなければ無効であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors).to be_added(:email, :blank)
    end

    it 'パスワードがなければ無効であること' do
      @user.password = @user.password_confirmation = ' ' * 6
      @user.valid?
      expect(@user.errors).to be_added(:password, :blank)
    end
  end

  describe '値の一意確認' do
    it '重複したユーザー名なら無効であること' do
      user = FactoryBot.create(:user, user_name: 'foobar')
      duplicate_user = FactoryBot.build(:user, user_name: 'foobar')
      duplicate_user.valid?
      expect(duplicate_user.errors).to be_added(:user_name, :taken, value: 'foobar')
    end

    it '重複したメールアドレスなら無効であること' do
      user = FactoryBot.create(:user, email: 'foobar@example.com')
      duplicate_user = FactoryBot.build(:user, email: 'foobar@example.com')
      duplicate_user.valid?
      expect(duplicate_user.errors).to be_added(:email, :taken, value: 'foobar@example.com')
    end
  end

  describe '文字数の検証' do
    it 'ユーザー名が20文字以内なら有効であること' do
      @user.user_name = 'a' * 20
      expect(@user).to be_valid
    end

    it 'ユーザー名が20文字を越えるなら無効であること' do
      @user.user_name = 'a' * 21
      @user.valid?
      expect(@user.errors).to be_added(:user_name, :too_long, count: 20)
    end

    it 'メールアドレスが255文字以内なら有効であること' do
      @user.email = 'a' * 200 + '@example.com'
      expect(@user).to be_valid
    end

    it 'メールアドレスが255文字を越えるなら無効であること' do
      @user.email = 'a' * 255 + '@example.com'
      @user.valid?
      expect(@user.errors).to be_added(:email, :too_long, count: 255)
    end

    it 'パスワードが6文字未満なら無効であること' do
      @user.password = @user.password_confirmation = 'a' * 5
      @user.valid?
      expect(@user.errors).to be_added(:password, :too_short, count: 6)
    end

    it 'パスワードが6文字以上なら有効であること' do
      @user.password = @user.password_confirmation = 'a' * 6
      expect(@user).to be_valid
    end
  end
end
