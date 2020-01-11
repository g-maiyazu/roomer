require 'rails_helper'

RSpec.describe 'Search', type: :system do
  it '投稿/ユーザーを検索する' do
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
    expect(page).to have_content 'fooの部屋'

    # 投稿を検索
    fill_in 'キーワードを検索...', with: 'インテリア'
    click_button 'searchbtn'
    expect(current_path).to eq posts_path
    expect(page).to have_content 'みんなの写真'
    expect(page).to have_link 'a'

    # ユーザーを検索
    click_button 'avatar'
    click_link 'すべてのユーザー'
    expect(current_path).to eq users_path

    fill_in 'ユーザーを検索...', with: 'bar'
    click_button 'searchbtn'
    expect(current_path).to eq users_path
    expect(page).to have_content 'bar'
  end
end
