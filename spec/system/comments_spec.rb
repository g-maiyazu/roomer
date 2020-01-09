require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  it '既存の投稿にコメントをして、削除する' do
    post = FactoryBot.create(:post, caption: 'これが私の部屋です')
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
    expect(page).to have_content 'testの部屋'

    # ページ遷移
    visit post_path(post)
    expect(current_path).to eq post_path(post)
    expect(page).to have_content 'これが私の部屋です'

    # 無効な文字数を入力した場合
    fill_in '公開コメントを入力...', with: 'a' * 141
    click_button '送信'
    expect(page).to have_content 'コメントを投稿できませんでした。140字以内で入力してください。'

    # コメントする
    fill_in '公開コメントを入力...', with: 'オシャレなお部屋ですね'
    expect do
      click_button '送信'
      expect(page).to have_content 'オシャレなお部屋ですね'
      expect(page).to have_content 'コメントを投稿しました。'
    end.to change(post.comments, :count).by(1)

    # コメントを削除する
    expect do
      click_link 'コメント削除'
      expect(page).to have_content 'コメントを削除しました'  
    end.to change(Comment, :count).by(-1)
  end
end
