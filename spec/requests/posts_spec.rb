require 'rails_helper'
describe PostsController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post_form, user_id: user.id)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get posts_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスにヘッダーロゴが存在する' do 
      get posts_path
      expect(response.body).to include('<img class="logo" src="/assets/logo-1e4cfe7e9e492c6401f0ad54e71e2f62678dac57131bcd4bd8d44f1c98c45c80.png" />')
    end

    it 'indexアクションにリクエストするとレスポンスに検索フォームが存在する' do 
      get posts_path
      expect(response.body).to include('<input placeholder="投稿検索" class="input-search" id="post_form_tag_name" maxlength="40" size="40" type="text" name="search" />')
    end

    it 'indexアクションにリクエストするとレスポンスにアプリの特徴画像が3つ存在する' do 
      get posts_path
      expect(response.body).to include(' <img class="list-pict" src="/assets/idea-b4ee3084e8350929024796405ab68c318ec7a8b5cc1a9a9bbde2164b43d7cb9c.png" />')
      expect(response.body).to include(' <img class="list-pict" src="/assets/communication-f52b58e557572aa919f7ba24a4b6c39e2d91a0a0f467b0693bc9e20d19face34.png" />')
      expect(response.body).to include('<img class="list-pict" src="/assets/teacher-6dd12e0ea4dd7694cc7da87aa013df443a67a502ada10b53e5e204886e64afb8.png" />')
    end

    it 'indexアクションにリクエストするとレスポンスにみんなの投稿が存在する' do 
      get posts_path
      expect(response.body).to include('みんなの投稿')
    end

    context "ログインしている場合" do
      before do
        sign_in @user
      end
      it 'indexアクションにリクエストするとレスポンスに投稿ボタンが存在する' do 
        get posts_path
        expect(response.body).to include('<a class="nav-btn" href="/posts/new">投稿</a>')
      end
  
      it 'indexアクションにリクエストするとレスポンスに通知ベルアイコンが存在する' do 
        get posts_path
        expect(response.body).to include('<i class="bi bi-bell size"></i>')
      end
  
      it 'indexアクションにリクエストするとレスポンスにユーザーアイコンが存在する' do 
        get posts_path
        expect(response.body).to include('<i class="bi bi-person-circle size"></i>')
      end
    end

    context "ログインしていない場合" do
      it 'indexアクションにリクエストするとレスポンスにログインボタンが存在する' do 
        get posts_path
        expect(response.body).to include('<a class="nav-btn" href="/users/sign_in">ログイン</a>')
      end
  
      it 'indexアクションにリクエストするとレスポンスに新規登録ボタンが存在する' do 
        get posts_path
        expect(response.body).to include('<a class="nav-btn" href="/users/sign_up">新規登録</a>')
      end
    end

  end

  describe 'GET #new' do
    context "ログインしている場合" do
      before do
        sign_in @user
      end
      it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do 
        get new_post_path
        expect(response.status).to eq 200
      end

      it 'newアクションにリクエストするとレスポンスに新規投稿のフォームヘッダーテキストが存在する' do 
        get new_post_path
        expect(response.body).to include('新規投稿')
      end

      it 'newアクションにリクエストするとレスポンスに学校欄項目のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<select class="input-name" id="user_age" name="post_form[school_list]"><option value="">学校を選択</option>')
      end
      it 'newアクションにリクエストするとレスポンスに科目名のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<input class="input-default" id="post_course" placeholder="例)政治経済 " maxlength="40" size="40" type="text" name="post_form[course]" />')
      end
     
      it 'newアクションにリクエストするとレスポンスに単元名のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<input class="input-default" id="post_unit" placeholder="例)選挙の仕組み " maxlength="40" size="40" type="text" name="post_form[unit]" />')
      end
     
      it 'newアクションにリクエストするとレスポンスに導入時間のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<input class="input-name" id="post_introduction_time" placeholder="例)5" maxlength="40" size="40" type="text" name="post_form[introduction_time]" />')
      end
     
      it 'newアクションにリクエストするとレスポンスに導入のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<textarea class="input-class" id="post_introduction" placeholder="導入を記入してください" name="post_form[introduction]">')
      end
     
      it 'newアクションにリクエストするとレスポンスに展開時間のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<input class="input-name" id="post_development_time" placeholder="例)40" maxlength="40" size="40" type="text" name="post_form[development_time]" />')
      end
     
      it 'newアクションにリクエストするとレスポンスに展開のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<textarea class="input-class" id="post_development" placeholder="展開を記入してください" name="post_form[development]">')
      end
     
      it 'newアクションにリクエストするとレスポンスにまとめ時間のフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<input class="input-name" id="post_summary_time" placeholder="例)5" maxlength="40" size="40" type="text" name="post_form[summary_time]" />')
      end
     
      it 'newアクションにリクエストするとレスポンスにまとめのフォームが存在する' do 
        get new_post_path
        expect(response.body).to include('<textarea class="input-class" id="post_summary" placeholder="まとめを記入してください" name="post_form[summary]">')
      end
     
      it 'newアクションにリクエストするとレスポンスにファイル選択が存在する' do 
        get new_post_path
        expect(response.body).to include(' <input name="post_form[images][]" data-index="0" id="post_images" type="file" />')
      end
     
      it 'newアクションにリクエストするとレスポンスに投稿するボタンが存在する' do 
        get new_post_path
        expect(response.body).to include('<input type="submit" name="commit" value="投稿する" class="form_btn" data-disable-with="投稿する" />')
      end
    end

    context "ログインしていない場合" do
      it 'ログインページにリダイレクトされる' do
        get new_post_path
        expect(response.status).to eq 302
      end
    end
  end
end