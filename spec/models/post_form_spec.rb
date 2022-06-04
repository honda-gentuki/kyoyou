require 'rails_helper'

RSpec.describe PostForm, type: :model do
  describe '新規投稿' do
    before do
      user = FactoryBot.create(:user)
      @post_form = FactoryBot.build(:post_form, user_id: user.id)
    end

    context 'ユーザーが新規投稿できるとき' do
      it '必須項目が正しく入力されていれば投稿できる' do
        expect(@post_form).to be_valid
      end

      it '画像が空でも登録できる' do
        @post_form.images = ''
        expect(@post_form).to be_valid
      end
    end

    context 'ユーザーが新規投稿できないとき' do
      it '学校欄が空では投稿できない' do
        @post_form.school_list = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('学校欄を入力してください')
      end

      it '科目名が空では投稿できない' do
        @post_form.course = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('科目名を入力してください')
      end

      it '単元名が空では投稿できない' do
        @post_form.unit = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('単元名を入力してください')
      end

      it '導入時間が空では投稿できない' do
        @post_form.introduction_time = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('導入の時間は数値で入力してください')
      end

      it '導入時間は半角数値でないと投稿できない' do
        @post_form.introduction_time = 'じゅう'
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('導入の時間は数値で入力してください')
      end

      it '展開時間が空では投稿できない' do
        @post_form.development_time = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('展開の時間は数値で入力してください')
      end

      it '展開時間は半角数値でないと投稿できない' do
        @post_form.development_time = 'ご'
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('展開の時間は数値で入力してください')
      end

      it 'まとめ時間が空では投稿できない' do
        @post_form.summary_time = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('まとめの時間は数値で入力してください')
      end

      it 'まとめ時間は半角数値でないと投稿できない' do
        @post_form.summary_time = 'ご'
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('まとめの時間は数値で入力してください')
      end

      it 'ユーザーが紐付いていないと保存できないこと' do
        @post_form.user_id = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
