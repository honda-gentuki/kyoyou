require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'コメントが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end

     context 'コメントが投稿できない場合' do
      it 'コメントが空では保存できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
      end
      it '投稿が紐付いていないと保存できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("投稿を入力してください")
      end
    end
  end
end