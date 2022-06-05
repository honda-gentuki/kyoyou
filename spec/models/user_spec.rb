require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できるとき' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it '年齢が空でも登録できる' do
        @user.age = ''
        expect(@user).to be_valid
      end

      it '性別が空でも登録できる' do
        @user.sex = ''
        expect(@user).to be_valid
      end

      it '学校名が空でも録できる' do
        @user.school = ''
        expect(@user).to be_valid
      end

      it '担当教科が空でも録できる' do
        @user.subject = ''
        expect(@user).to be_valid
      end

      it '部活名が空でも録できる' do
        @user.club = ''
        expect(@user).to be_valid
      end

      it '自己紹介が空でも録できる' do
        @user.introduce = ''
        expect(@user).to be_valid
      end

      it '画像が空でも録できる' do
        @user.image = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'メールアドレスが空ではでは登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.password_confirmation = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードと確認用パスワードの値が一致しなければ登録できない' do
        @user.password = 'aaa222'
        @user.password_confirmation = 'bbb333'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end

      it 'パスワードが数字だけでは登録できない' do
        @user.password = '222222'
        @user.password_confirmation = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードには英字と数字の両方を含めて設定してください')
      end

      it '名が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end

      it '名が全角以外(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.first_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名には全角文字を使用してください')
      end

      it '姓が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください')
      end

      it '姓が全角以外(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓には全角文字を使用してください')
      end

      it 'メイが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メイを入力してください')
      end

      it 'メイが全角以外（カタカナ）以外では登録できない' do
        @user.first_name_kana = '一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('メイには全角カナ文字を使用してください')
      end

      it 'セイが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('セイを入力してください')
      end

      it 'セイが全角以外（カタカナ）以外では登録できない' do
        @user.last_name_kana = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include('セイには全角カナを使用してください')
      end
    end
  end
end
