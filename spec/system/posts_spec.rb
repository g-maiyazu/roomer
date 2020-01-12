require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  it '新規投稿したあと、その投稿を編集する' do
    user = FactoryBot.create(:user, user_name: 'test', email: 'test@mail.com')
    user.create_profile

    # ログイン
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'test@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    # 新規投稿
    click_button 'avatar'
    click_link '投稿'
    expect(current_path).to eq new_post_path

    attach_file 'post[image]', "#{Rails.root}/spec/fixtures/room.png", make_visible: true
    fill_in 'おすすめインテリア情報を入力...', with: '私の部屋は白を基調にしています'
    expect do
      click_button '投稿を送信'
    end.to change(Post, :count).by(1)

    expect(current_path).to eq user_path(user)
    expect(page).to have_content '投稿されました'

    post = Post.first
    expect(post.caption).to eq '私の部屋は白を基調にしています'
    expect(page).to have_link 'a', href: "/posts/#{post.id}"

    visit post_path(post)
    expect(current_path).to eq post_path(post)
    expect(page).to have_content '私の部屋は白を基調にしています'

    # 投稿編集
    # find('button#post-dropdown').click
    # #click_link '投稿を削除'
    # page.accept_confirm '本当に削除しますか?' do
    #   click_link '投稿を削除'
    # end
  end
end
