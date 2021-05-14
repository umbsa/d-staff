# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false,              |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| full_name          | string  | null: false               |
| full_name_kana     | string  | null: false               |
| user_birth_date    | date    | null: false               |

### Association

- has_many :verifications
- has_many :reservations
- has_one :card, dependent: :destroy

## staffs テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| history               | text       | null: false                    |
| comment               | string     | null: false                    |
| hobby                 | text       | null: false                    |
| price                 | references | null: false, foreign_key: true |

### Association

- has_many :verifications
- has_many :reservations
- has_one :staff_order

## staff_orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| staff  | references | null: false, foreign_key: true |


### Association

- belongs_to :staff


## reservations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| start_time    | datetime   |                                |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| staff         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :staff
- belongs_to :user

## cards テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_token            | string     | null: false                    |
| customer_token        | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user