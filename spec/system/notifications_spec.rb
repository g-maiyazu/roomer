require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  it '通知の確認をする', js: true do
    alice = FactoryBot.create(:user, user_name: 'alice', email: 'alice@mail.com')
    alice.create_profile
    alice.passive_notifications.build
    bob = FactoryBot.create(:user, user_name: 'bob', email: 'bob@mail.com')
    bob.create_profile
    post = FactoryBot.create(:post, caption: 'インテイリアにこだわっています', user: bob)

    # aliceでログインする
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'alice@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'aliceの部屋'

    visit user_path(bob)
    expect(page).to have_content 'bobの部屋'

    # フォロー
    expect do
      click_button 'フォロー'
      expect(page).to have_button 'フォロー中'
      expect(page).to have_content 'フォロワー 1'
    end.to change(alice.following, :count).by(1) & change(bob.followers, :count).by(1)

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

    # bobでログインする
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'bob@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'bobの部屋'

    click_link 'notification'
    expect(current_path).to eq notifications_path
    expect(page).to have_content 'aliceさんがあなたの投稿に「いいね！」しました'
    expect(page).to have_content 'aliceさんがあなたをフォローしました'
  end
end
