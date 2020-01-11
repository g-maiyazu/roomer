require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  it 'ユーザーをフォロー/フォロー解除する', js: true do
    foo = FactoryBot.create(:user, user_name: 'foo', email: 'foo@mail.com')
    foo.create_profile
    bar = FactoryBot.create(:user, user_name: 'bar', email: 'bar@mail.com')
    bar.create_profile

    # ログインする
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foo@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    # フォローするユーザーのプロフィールページに遷移
    visit user_path(bar)
    expect(page).to have_content 'barの部屋'

    expect do
      click_button 'フォロー'
      expect(page).to have_button 'フォロー中'
      expect(page).to have_content 'フォロワー 1'
    end.to change(foo.following, :count).by(1) & change(bar.followers, :count).by(1)

    expect do
      click_button 'フォロー中'
      expect(page).to have_button 'フォロー'
      expect(page).to have_content 'フォロワー 0'
    end.to change(foo.following, :count).by(-1) & change(bar.followers, :count).by(-1)
  end
end
