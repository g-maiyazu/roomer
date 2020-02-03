require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  it 'ログイン/ログアウトできること' do
    FactoryBot.create(:user,
                      user_name: 'example',
                      email: 'example@email.com',
                      password: 'password')

    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    # ログインに失敗する場合
    click_button 'ログインする'
    expect(page).to have_content 'メールアドレスまたはパスワードが違います。'

    fill_in 'メールアドレス', with: 'sample@mail.com'
    fill_in 'パスワード', with: 'foobar'
    click_button 'ログインする'
    expect(page).to have_content 'メールアドレスまたはパスワードが違います。'

    # ログイン後のフラッシュメッセージが生成されないことを確認
    expect(page).to_not have_content 'ログインしました。'

    # 有効なユーザー情報の場合
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'example@email.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    # ログアウトできることを確認
    click_on 'avatar'
    expect(page).to have_content 'ログアウト'

    click_on 'ログアウト'
    expect(current_path).to eq root_path

    # ログイン後のフラッシュメッセージが生成されないことを確認
    expect(page).to_not have_content 'ログアウトしました。'
  end

  it '管理ユーザーとしてログインする', js: true do
    admin = FactoryBot.create(:user, :admin)
    user = FactoryBot.create(:user)
    user.create_profile

    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'admin@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'あなたのフィード'

    # 管理ユーザーは通常のユーザーを削除できること
    visit user_path(user)
    expect(page).to have_content '強制退会'

    # click_link '強制退会'
    # page.accept_confirm '本当に退会させてもよろしいですか？' do
    #   click_button '退会させる'
    # end

    # expect(current_path).to eq users_path
    # expect(page).to have_content 'すべてのユーザー'
  end
end
