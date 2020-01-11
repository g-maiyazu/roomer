require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  it 'プロフィールを編集する' do
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

    # プロフィールを編集する
    click_button 'avatar'
    click_link 'マイルーム'
    expect(current_path).to eq user_path(user)
    expect(page).to have_content 'testの部屋'

    click_link 'プロフィール編集'
    expect(current_path).to eq edit_profile_path(user)
    expect(page).to have_content '公開情報'

    # 無効な文字数を入力した場合
    fill_in 'profile_introduction', with: 'a' * 141
    click_button '変更を保存する'
    expect(current_path).to eq edit_profile_path(user)
    expect(page).to have_content 'プロフィール更新に失敗しました。編集項目を確認してください。'

    # プロフィールを編集する
    expect(current_path).to eq edit_profile_path(user)
    expect(page).to have_content '公開情報'

    fill_in 'profile_age', with: '30'
    find("option[value='man']").select_option
    find("option[value='beauty']").select_option
    find("option[value='alone']").select_option
    find("option[value='one_DK']").select_option
    fill_in 'profile_floor_width', with: '300㎡'
    fill_in 'profile_web_site', with: 'test.com'
    fill_in 'profile_introduction', with: 'よろしく'

    click_button '変更を保存する'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content 'testの部屋'
    expect(page).to have_content 'プロフィールを更新しました'

    expect(page).to have_content '30'
    expect(page).to have_content '男性'
    expect(page).to have_content '美容系'
    expect(page).to have_content '一人暮らし'
    expect(page).to have_content '1DK'
    expect(page).to have_content '300㎡'
    expect(page).to have_content 'test.com'
    expect(page).to have_content 'よろしく'
  end
end
