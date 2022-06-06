require 'rails_helper'
describe PostsController, type: :request do

  before do
    @post = FactoryBot.build(:post_form)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get posts_path(@post)
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスにヘッダーロゴが存在する' do 
      get posts_path(@post)
      expect(response.body).to include('<img class="logo" src="/assets/logo-1e4cfe7e9e492c6401f0ad54e71e2f62678dac57131bcd4bd8d44f1c98c45c80.png" />')
    end

    it 'indexアクションにリクエストするとレスポンスにアプリの特徴画像が3つ存在する' do 
      get posts_path(@post)
      expect(response.body).to include(' <img class="list-pict" src="/assets/idea-b4ee3084e8350929024796405ab68c318ec7a8b5cc1a9a9bbde2164b43d7cb9c.png" />')
      expect(response.body).to include(' <img class="list-pict" src="/assets/communication-f52b58e557572aa919f7ba24a4b6c39e2d91a0a0f467b0693bc9e20d19face34.png" />')
      expect(response.body).to include('<img class="list-pict" src="/assets/teacher-6dd12e0ea4dd7694cc7da87aa013df443a67a502ada10b53e5e204886e64afb8.png" />')
    end

    it 'indexアクションにリクエストするとレスポンスにみんなの投稿が存在する' do 
      get posts_path(@post)
      expect(response.body).to include('みんなの投稿')
    end
  end
end