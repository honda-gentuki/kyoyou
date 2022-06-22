require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '通知機能' do
    context '投稿関連の通知' do
      before do
        @comment = FactoryBot.build(:comment)
        @like = FactoryBot.build(:like)
        @post = FactoryBot.build(:post)
      end

      it '投稿にいいねが行われた場合に通知できる' do
        notification = FactoryBot.build(:notification, post_id: @post.id, action: 'like')
        expect(notification).to be_valid
      end

      it '投稿にコメントが行われた場合に通知できる' do
        notification = FactoryBot.build(:notification, post_id: @post.id, action: 'comment')
        expect(notification).to be_valid
      end

      context 'フォロー関連の通知' do
        it 'フォローが行われた場合に通知できる' do
          user1 = FactoryBot.build(:user)
          user2 = FactoryBot.build(:user)
          notification = FactoryBot.build(:notification, visiter_id: user1.id, visited_id: user2.id, action: 'follow')
          expect(notification).to be_valid
        end
      end
    end

    describe 'アソシエーションのテスト' do
      let(:association) do
        described_class.reflect_on_association(target)
      end

      context '投稿モデルとのアソシエーション' do
        let(:target) { :post }

        it '投稿との関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end

      context 'コメントモデルとのアソシエーション' do
        let(:target) { :comment }

        it 'コメントとの関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end

      context '通知とのアソシエーション' do
        let(:target) { :visiter }

        it '通知との関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end

      context '通知済とのアソシエーション' do
        let(:target) { :visited }

        it '通知済との関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end
    end
  end
end
