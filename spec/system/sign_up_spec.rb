require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  it '新規登録できること' do
    visit new_user_registration_path
    expect(page).to have_content "新規登録"

    fill_in 'ユーザー名', with: 'foobar'
    fill_in 'メールアドレス', with: 'foobar@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    expect do
      click_button 'アカウントを作成する'
    end.to change(User, :count).by(1)

    expect(current_path).to eq confirm_email_path
    expect(page).to have_content 'メールを送信しました'
  end
end

