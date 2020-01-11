require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  it '投稿にいいね/いいね解除する', js: true do
    post = FactoryBot.create(:post, caption: 'インテイリアにこだわっています')
    foobar = FactoryBot.create(:user, user_name: 'foobar', email: 'foobar@mail.com')
    foobar.create_profile

    # ログインする
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foobar@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    # 投稿にいいねをする
    visit post_path(post)
    expect(page).to have_content 'インテイリアにこだわっています'
    expect(page).to have_content '0いいね！'

    expect do
      click_button 'いいね！'
      expect(page).to have_button '1いいね！'
    end.to change(post.likes, :count).by(1)

    # 投稿のいいねを解除する
    visit post_path(post)
    expect(page).to have_content 'インテイリアにこだわっています'

    expect do
      click_button 'いいね！'
      expect(page).to have_button '0いいね！'
    end.to change(post.likes, :count).by(-1)
  end
end
