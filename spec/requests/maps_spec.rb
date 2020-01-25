require 'rails_helper'

RSpec.describe 'maps', type: :request do
  describe 'indexページ' do
    it '正しいレスポンスが確認されること' do
      get maps_path
      expect(response).to have_http_status(200)
    end
  end
end
