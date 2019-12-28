require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  include ActiveJob::TestHelper

  scenario 'ユーザーの新規登録が成功すること' do
    visit root_path
    click_link '新規登録'

    perform_enqueued_jobs do
      expect do
        fill_in 'ユーザー名', with: 'foobar'
        fill_in 'メールアドレス', with: 'foobar@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button 'アカウントを作成する'
      end.to change(User, :count).by(1)

      expect(current_path).to eq root_path
    end
  end
end
