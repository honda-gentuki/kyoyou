require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe 'チャット投稿' do
    context 'チャットが投稿できる場合' do
      it 'チャットが存在していれば送信できる' do
        expect(@chat).to be_valid
      end
    end

    context 'チャットが投稿できない場合' do
      it 'チャットが空では送信できない' do
        @chat.message = ''
        @chat.valid?
        expect(@chat.errors.full_messages).to include('メッセージを入力してください')
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @chat.user = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'チャットルームが紐付いていないと送信できない' do
        @chat.room = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('チャットルームを入力してください')
      end
    end
  end
end
