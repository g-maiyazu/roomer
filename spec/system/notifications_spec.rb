require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  it '通知の確認をする', js: true do
    foo = FactoryBot.create(:user, user_name: 'foo', email: 'foo@mail.com')
    foo.create_profile
    foo.passive_notifications.build
    bar = FactoryBot.create(:user, user_name: 'bar', email: 'bar@mail.com')
    bar.create_profile
    post = FactoryBot.create(:post, caption: 'インテイリアにこだわっています', user: bar)

    # fooでログインする
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foo@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    visit user_path(bar)
    expect(page).to have_content 'barの部屋'

    # フォロー
    expect do
      click_button 'フォロー'
      expect(page).to have_button 'フォロー中'
      expect(page).to have_content 'フォロワー 1'
    end.to change(foo.following, :count).by(1) & change(bar.followers, :count).by(1)

    # お気に入り
    visit post_path(post)
    expect(page).to have_content 'インテイリアにこだわっています'
    expect(page).to have_content '0いいね！'

    expect do
      click_button 'いいね！'
      expect(page).to have_button '1いいね！'
    end.to change(post.likes, :count).by(1)

    click_button 'avatar'
    click_link 'ログアウト'
    expect(current_path).to eq root_path

    # barでログインする
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'bar@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    click_link 'notification'
    expect(current_path).to eq notifications_path
    expect(page).to have_content 'fooさんがあなたの投稿に「いいね！」しました'
    expect(page).to have_content 'fooさんがあなたをフォローしました'
  end
end
