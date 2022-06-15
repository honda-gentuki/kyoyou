require 'rails_helper'
describe ChatsController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end
  
  describe 'GET #index' do
    context "ログインしている場合" do
      before do
        sign_in @user
      end
      it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
        get chats_path(@user)
        expect(response.status).to eq 200
      end
      it 'indexアクションにリクエストすると正常にレスポンスに見出しのチャットルームが存在する' do 
        get chats_path(@user)
        expect(response.body).to include('チャットルーム')
      end
    end
  end
  context "ログインしていない場合" do
    it 'ログインページにリダイレクトされる' do
      get chats_path(@user)
      expect(response.status).to eq 401
      
    end
  end

  describe 'GET #show' do
    context "ログインしている場合" do
      before do
        sign_in @user
        another_user = build(:user)
      end
      it 'showアクションにリクエストしても自身とのチャットページであればリダイレクトされる' do 
        get chat_path(@user)
        expect(response.status).to eq 302
      end
      it 'showアクションにリクエストしても他のユーザーとのチャットページであれば正常にレスポンスが返ってくる' do 
        get chat_path(another_user)
        expect(response.status).to eq 200
      end
    end
  end
  context "ログインしていない場合" do
    it 'ログインページにリダイレクトされる' do
      get chats_path(@user)
      expect(response.status).to eq 401
    end
  end
end

