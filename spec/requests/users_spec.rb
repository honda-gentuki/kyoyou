require 'rails_helper'
describe UsersController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context "ログインしている場合" do
      before do
        sign_in @user
      end
      it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
        get user_path(@user)
        expect(response.status).to eq 200
      end
      it 'showアクションにリクエストするとレスポンス見出しのにユーザのニックネームが存在する' do 
        get user_path(@user)
        expect(response.body).to include("#{@user.nickname}先生のプロフィール")
      end
      it 'showアクションにリクエストするとレスポンスにユーザのニックネームが存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.nickname)
      end
      it 'showアクションにリクエストするとレスポンスにユーザの年齢が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.age)
      end
      it 'showアクションにリクエストするとレスポンスにユーザの性別が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.sex)
      end
      it 'showアクションにリクエストするとレスポンスに編集アイコンが存在する' do 
        get user_path(@user)
        expect(response.body).to include('<i class="bi bi-gear-wide-connected"></i>')
      end
      it 'showアクションにリクエストするとレスポンスにいいねアイコンが存在する' do 
        get user_path(@user)
        expect(response.body).to include('<i class="bi bi-clipboard-heart"></i>')
      end
      it 'showアクションにリクエストするとレスポンスにメッセージアイコンが存在する' do 
        get user_path(@user)
        expect(response.body).to include('<i class="bi bi-envelope"></i>')
      end
      it 'showアクションにリクエストするとレスポンスにフォロー数が存在する' do 
        get user_path(@user)
        expect(response.body).to include('<div class="follow_count" style="color: black;">フォロー0人</div>')
      end
      it 'showアクションにリクエストするとレスポンスにフォロワー数が存在する' do 
        get user_path(@user)
        expect(response.body).to include('<div class="follower_count" style="color: black;">フォロワー0人</div>')
      end
      it 'showアクションにリクエストするとレスポンスにユーザの学校が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.school)
      end
      it 'showアクションにリクエストするとレスポンスにユーザの担当教科が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.subject)
      end
      it 'showアクションにリクエストするとレスポンスにユーザの部活動が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.club)
      end
      it 'showアクションにリクエストするとレスポンスにユーザの自己紹介が存在する' do 
        get user_path(@user)
        expect(response.body).to include(@user.introduce)
      end
      it 'showアクションにリクエストするとレスポンス見出しのにユーザの投稿が存在する' do 
        get user_path(@user)
        expect(response.body).to include("#{@user.nickname}先生の投稿")
      end
    end

    context "ログインしていない場合" do
      it 'ログインページにリダイレクトされる' do
        get user_path(@user)
        expect(response.status).to eq 302
      end
    end

    describe 'GET #following' do
      context "ログインしている場合" do
        before do
          sign_in @user
        end
        it 'followingアクションにリクエストすると正常にレスポンスが返ってくる' do 
          get following_user_path(@user)
          expect(response.status).to eq 200
        end
        it 'followingアクションにリクエストすると正常にレスポンスに見出しのフォローが存在する' do 
          get following_user_path(@user)
          expect(response.body).to include('フォロー')
        end
      end
      context "ログインしていない場合" do
        it 'ログインページにリダイレクトされる' do
          get following_user_path(@user)
          expect(response.status).to eq 302
        end
      end
    end

    describe 'GET #followers' do
      context "ログインしている場合" do
        before do
          sign_in @user
        end
        it 'followersアクションにリクエストすると正常にレスポンスが返ってくる' do 
          get following_user_path(@user)
          expect(response.status).to eq 200
        end
        it 'followersアクションにリクエストすると正常にレスポンスに見出しのフォロワーが存在する' do 
          get followers_user_path(@user)
          expect(response.body).to include('フォロー')
        end
      end
      context "ログインしていない場合" do
        it 'ログインページにリダイレクトされる' do
          get followers_user_path(@user)
          expect(response.status).to eq 302
        end
      end
    end
  end
end
