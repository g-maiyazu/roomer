require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  it '新規登録できること' do
    visit new_user_registration_path
    expect(page).to have_content '新規登録'
    expect(current_path).to eq new_user_registration_path
    expect(page).to have_content '6文字以上'

    # 登録に失敗する場合
    fill_in 'ユーザー名', with: ''
    fill_in 'メールアドレス', with: 'sample@invalid'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード確認', with: 'abcdef'

    click_button 'アカウントを作成する'
    expect(page).to have_content 'ユーザー名を入力してください'
    expect(page).to have_content 'メールアドレスは不正な値です'
    expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'

    # 登録に成功する場合
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
