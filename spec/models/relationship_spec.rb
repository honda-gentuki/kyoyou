require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.create(:relationship) }
  describe 'フォロー機能' do
    context 'フォローできる場合' do
      it '全てのパラメーターが揃っていれば保存できる' do
        expect(relationship).to be_valid
      end
    end

    context 'フォローできない場合' do
      it 'フォロワーが空の場合は保存できない' do
        relationship.follower_id = nil
        relationship.valid?
        expect(relationship.errors[:follower_id]).to include('を入力してください')
      end

      it 'フォローが空の場合は保存できない' do
        relationship.following_id = nil
        relationship.valid?
        expect(relationship.errors[:following_id]).to include('を入力してください')
      end
    end

    context '一意性の検証' do
      before do
        @relation = FactoryBot.create(:relationship)
        @user1 = FactoryBot.build(:relationship)
      end
      it 'フォロワーが同じでもフォローが違うなら保存できる' do
        relation2 = FactoryBot.build(:relationship, follower_id: @relation.follower_id, following_id: @user1.following_id)
        expect(relation2).to be_valid
      end

      it 'フォロワーが違うならフォローが同じでも保存できる' do
        relation2 = FactoryBot.build(:relationship, follower_id: @user1.follower_id, following_id: @relation.following_id)
        expect(relation2).to be_valid
      end
    end
  end

  describe '各モデルとのアソシエーション' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context '仮想モデルfollowerとのアソシエーション' do
      let(:target) { :follower }

      it 'Followerとの関連付けはbelongs_toであること' do
        expect(association.macro).to  eq :belongs_to
      end
    end

    context '仮想モデルfollowingとのアソシエーション' do
      let(:target) { :following }

      it 'followingとの関連付けはbelongs_toであること' do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end
end
