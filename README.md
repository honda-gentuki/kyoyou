# アプリケーション名
教YOU
# アプリケーション概要
# URL
# テスト用アカウント
# 利用方法
# アプリケーションを作成した背景
# 洗い出した要件
# 実装した機能についての画像やGIFおよびその説明
# 実装予定の機能
# データベース設計
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