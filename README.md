# アプリケーション名
### 教YOU[![Image from Gyazo](https://i.gyazo.com/d837df221d335c2ab86554a3354c0d39.jpg)](https://gyazo.com/d837df221d335c2ab86554a3354c0d39)

# アプリケーション概要
### 教員の業務時間削減を目的とした業務教YOU(共有)アプリ。

# URL
http://kyoyou.site/

# テスト用アカウント
Basic認証ID：takutoo<br>
Basic認証PASS：2525<br>
メールアアドレス：syakaitaro@kyoyou.com<br>
パスワード：syakai1

# 利用方法
## 授業投稿
1, トップページのヘッダーから新規登録。<br>
2, 要約した授業内容をフォームに入力し、投稿するボタンから授業の内容を入力し投稿（画像部分は板書案・スライド・授業の添付資料・指導案を添付）。<br>
3, 投稿内容を自身で確認(自身の授業をいつでも振り返る事ができる)。また、他のユーザーの投稿を参考に授業に活かすことができる。<br>

## 授業にコメント
1, コメントしたい投稿カードのチャット(吹き出し)アイコンをクリック。
2, コメントフォームを入力し、送信ボタンをクリック。
3, 投稿にコメントができる。

## ユーザーをフォロー
1, フォローしたいユーザーの投稿カードからユーザーのアイコン画像、又はユーザーのニックネームをクリックしユーザー詳細ページに遷移。<br>
2, ユーザー詳細ページのユーザーカードのフォローボタンをクリックし、フォロー一覧ページにユーザーを保存。<br>
3, フォローしたユーザーを常に確認できる。

## ユーザーとチャット
1, フォローしたいユーザーの投稿カードからユーザーのアイコン画像、又はユーザーのニックネームをクリックしユーザー詳細ページに遷移。<br>
2, ユーザーカードのDM(メールマーク)アイコンからチャットページに遷移。<br>
3, フォームを入力し、送信することで、教員同士の会話が楽しめる。

## いいねで授業を保存
1, 投稿カードのいいねアイコンをクリックし、いいね一覧ページに投稿を保存。<br>
2, ヘッダーのユーザーアイコンをクリックし、いいね一覧ページに遷移。
2, いいね一覧ページからいつでもいいねした投稿が観覧可能。

# アプリケーションを作成した背景・実装した機能についての画像やGIFおよびその説明・工夫ポイントしたポイントなど。
以下のスライドショーをご覧ください。
https://docs.google.com/presentation/d/1Xxg3dc_g6JIvqaO8KLFfZAp5s4GVsZUx8Fe3cOvitcQ/edit?usp=sharing

# 洗い出した要件
https://docs.google.com/spreadsheets/d/11dfzMkYT1b7q02jN6W7dYq7yp11eQOAG65TMmG8V9LQ/edit#gid=982722306

# 実装予定の機能
- 部活指導動投稿機能
- pdf投稿機能
- チャット画像投稿機能
- コントローラー単体テストコード
- 結合テストコード
- Action Cableを用いたチャット機能
- Dockerの導入
- CircleCI

# インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/6ed1b7ffa274b9064cccbb2a9e81d9da.png)](https://gyazo.com/6ed1b7ffa274b9064cccbb2a9e81d9da)

# データベース設計
![KYOYOU_ER図](https://user-images.githubusercontent.com/100074969/171890006-c446dedd-72b2-44c8-a3b6-0fced81bdd82.png)


# 画面遷移図
![教YOU＿画面遷移図](https://user-images.githubusercontent.com/100074969/171888907-9d82ad4b-5880-4f96-80d9-84e374e765ac.png)

# 開発環境
**コーディング** <br>
HTML / CSS<br>
**フロントエンド** <br>
JavaScript / jQuery<br>
**バックエンド** <br>
Ruby（Ruby on Rails）<br>
**インフラ** <br>
MySQL / AWS / Heroku / Docker / CircleCI /  Nginx<br>
**テスト** <br>
RSpec<br>
**テキストエディタ** <br>
VScode<br>
**タスク管理** <br>
GitHub / Slack<br>

# 使用技術
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 5.6
- Nginx
- AWS
- VPC
- EC2
- RDS
- Route53
- RSpec
- Docker/Docker-compose
- CircleCi 自動テスト

:::note alert
開発環境/使用技術には今後実装予定のものも含みます。
:::

# ローカルでの動作方法※
% git clone https://github.com/honda-gentuki/kyoyou.git <br>
% cd kyoyou <br>
% bundle install <br>
% yarn install

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| age                | string |                           |
| sex                | string |                           |
| school             | string |                           |
| subject            | string |                           |
| club               | string |                           |
| introduce          | text   |                           |
| image              | string |                           |

### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :follower
- has_many :following
- has_many :user_rooms
- has_many :rooms, through: :user_rooms
- has_many :chats
- has_many :visiter
- has_many :visited


## posts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| school_list        | string     | null: false                    |
| course             | string     | null: false                    |
| unit               | string     | null: false                    |
| introduction       | string     | null: false                    |
| introduction_time  | integer    | null: false                    |
| development        | text       | null: false                    |
| development_time   | integer    | null: false                    |
| summary            | text       | null: false                    |
| summary_time       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- has_many :notifications
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |
| content | text       | null: false                    |

### Association

- has_many :notifications
- belongs_to :user
- belongs_to :post


## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## relationships テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| follower  | references | null: false, foreign_key: true |
| following | references | null: false, foreign_key: true |

### Association

- belongs_to :follower
- belongs_to :following


## rooms テーブル

| Column | Type   | Options |
| ------ | ------ | ------- |

### Association

- has_many :chats
- has_many :user_rooms
- has_many :users, through: :user_rooms


## user_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## chats テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
| message | text       | null: false                    |

### Association

- has_many :notifications
- belongs_to :user
- belongs_to :room


##  notificationsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| visiter     | integer    | null: false, foreign_key: true |
| visited     | integer    | null: false, foreign_key: true |
| post_id     | integer    |                                |
| comment_id  | integer    |                                |
| chat_id     | integer    |                                |
| action      | string     | null: false                    |
| checked     | boolean    | null: false                    |

### Association

- belongs_to :post
- belongs_to :comment
- belongs_to :chat
- belongs_to :visiter
- belongs_to :visited