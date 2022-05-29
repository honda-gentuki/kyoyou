crumb :root do
  link "トップページ", root_path
end

crumb :posts_pagination do |page|
  link "#{page}ページ目"
  parent :root
end

crumb :user_new do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :user_login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :root
end

crumb :notifications do
  link "通知", notifications_path
  parent :root
end

crumb :post_show do |post|
  link "投稿詳細", post_path(post)
  parent :root
end

crumb :post_edit do |post|
  link "投稿編集"
  parent :post_show, post
end

crumb :search do |post|
  link "検索結果", search_posts_path
  parent :root
end

crumb :user_show do |user|
  link "マイページ", user_path(id: current_user.id)
  parent :root
end

crumb :user_edit do |user|
  link "#編集"
  parent :user_show, user
end

crumb :follows_user do |user|
  link "フォロー"
  parent :user_show, user
end

crumb :followers_user do |user|
  link "フォロワー"
  parent :user_show, user
end

crumb :like_index do |user|
  link "いいね一覧"
  parent :user_show, user
end

crumb :chat_index do |chat|
  link "チャットルーム", chats_path(id: current_user.id)
  parent :user_show, chat
end

crumb :chat_show do |chat|
  link "チャットページ"
  parent :chat_index, chat
end