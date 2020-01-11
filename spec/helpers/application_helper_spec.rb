require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    it 'ページタイトルが無い場合、サイト名だけを返すこと' do
      expect(full_title).to eq 'ROOMER'
    end

    it 'ページタイトルがある場合、完全なタイトルを返すこと ' do
      expect(full_title('Test')).to eq 'Test | ROOMER'
    end
  end

  describe 'date_format' do
    it '投稿やコメントがされてから現在までのおおよその時間/日数を返すこと' do
      post = FactoryBot.create(:post, created_at: 2.hours.ago)
      expect(date_format(post.created_at)).to eq '約2時間前'

      comment = FactoryBot.create(:comment, post: post, created_at: 10.minutes.ago)
      expect(date_format(comment.created_at)).to eq '10分前'
    end
  end
end
