# アプリケーション名
教YOU

# アプリケーション概要
教員の業務時間削減を目的とした業務教YOU(共有)アプリです。

# URL
https://kyoyou.herokuapp.com/

# テスト用アカウント
Basic認証ID：takutoo
Basic認証PASS：2525
メールアアドレス：test@com
パスワード：tesuto1

# 利用方法
## 授業投稿
1, トップページのヘッダーから新規登録。
2, 要約した授業内容をフォームに入力し、投稿するボタンから授業の内容を入力し投稿。（画像部分は板書案・スライド・授業の添付資料・指導案を添付）
3, 投稿内容を自身で確認。(自身の授業をいつでも振り返る事ができる。)
4, コメント部分でフィードバックをもらう。

## 教員同士のコミュニケーション
1, 投稿カードからユーザーのアイコン画像、又はユーザーのニックネームをクリックしユーザー詳細ページに遷移。
2, ユーザー詳細ページのユーザーカードのフォローボタンをクリックし、フォロー一覧ページにユーザーを保存。
3, ユーザーカードのDMアイコンからチャットページに遷移。
4, フォームを入力し、送信することで、教員同士の会話が楽しめる。

## いいねで授業保存
1, 投稿カードのいいねアイコンをクリックし、いいね一覧ページに投稿を保存。
2, いいね一覧ページからいつでも投稿が観覧可能。

# アプリケーションを作成した背景・実装した機能についての画像やGIFおよびその説明
以下スライドショーをご覧ください。
https://docs.google.com/presentation/d/1NN15b5MgdzpBu8yI-Vpg1nz42N5hI_q8SQtmP-DCMyU/edit#slide=id.gefadc01042_0_5


# 洗い出した要件
https://docs.google.com/spreadsheets/d/11dfzMkYT1b7q02jN6W7dYq7yp11eQOAG65TMmG8V9LQ/edit#gid=982722306

# 実装予定の機能
- 部活指導動投稿機能
- pdf投稿機能
- チャット画像投稿機能
- AWS
- Docker
- CircleCI

# データベース設計
![Uploading KYOYOU_ER図.png…]()
# 画面遷移図
# 開発環境
# ローカルでの動作方法※
# 工夫したポイント※

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