require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
    sleep 0.2
  end

  describe 'いいね機能' do
    context 'いいねできる場合' do
      it 'ユーザーと投稿があれば保存できる' do
        expect(@like).to be_valid
      end
    end

    context 'いいねできない場合' do
      it 'ユーザーが空ではいいねできない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('ユーザーを入力してください')
      end

      it '投稿が空ではいいねできない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('投稿を入力してください')
      end
    end
  end
end
