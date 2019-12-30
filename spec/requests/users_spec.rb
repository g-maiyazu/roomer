require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'indexページ' do
    it '正しいレスポンスが確認されること' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  #describe 'showページ' do
  #  let(:user) do
  #    FactoryBot.create(:user)
  #  end

  #  it '正しいレスポンスが確認されること' do
  #    get user_path(user.id)
  #    expect(response).to have_http_status(200)
  #  end
  #end
end
