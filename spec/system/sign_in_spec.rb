require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  scenario 'ユーザーのログインが成功すること' do
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログインする'

    expect(current_path).to eq root_path
  end
end
