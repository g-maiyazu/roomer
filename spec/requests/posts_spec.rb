require 'rails_helper'

RSpec.describe "posts", type: :request do
  describe '#new' do
    context '未ログイン状態のとき' do
      it 'リダイレクトされること' do
        get new_post_path
        expect(response.status).to eq 302
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'ログイン状態のとき' do
      before do
        user = FactoryBot.create(:user)
        sign_in user
      end

      it 'リクエストが成功すること' do
        get new_post_path
        expect(response.status).to eq 200
      end
    end
  end
end