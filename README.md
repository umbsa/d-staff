# アプリケーション詳細

## アプリケーション名
d-staff

## アプリケーションの概要
「宅配サービスを使うにあたって悪意のある人間が来るかもしれない」といったユーザーの不安の声を解消するために開発しました。
このアプリケーションではプロフィールで配達員の人となりや顔写真を見てから指名することで、安心して宅配サービスを利用できると考え制作に及びました。

# アプリケーションの利用方法

## URL

## テスト用アカウント
Basic認証のID/Pass sato/2233
管理者アカウントのEmail/Pass admin@example/1234567a
クレジットカードのテスト番号/CVC/有効期限 4242424242424242/123/今よりも未来

## 具体的な利用方法
1. トップページヘッダーのログインボタンから上記管理者アカウントのEmailとPasswordを入力することで管理者権限を持ったアカウントでログインすることができます。また、新規登録ボタンから通常アカウントとして新規登録ができます。ログインしているときはヘッダー右に「現在ログイン中のユーザーの名前」が出現します、クリックすることでクレジットカード登録の画面に遷移します。すでに登録してある場合はマイページに遷移して、ユーザーの情報を編集することができます。クレジットカード登録の際は上記のテスト番号をお使いください。

2. 管理者としてログインしているときにはヘッダー左に「スタッフ情報投稿」と「予約確認」が出現します。「スタッフ情報投稿」をクリックしていただきますと配達員の画像、名前、歴、コメント、趣味、そして配達料を入力するフォームが出ますので入力して「登録する」ボタンを押してください。

3. トップページに先ほど入力したスタッフが一覧で表示され、スタッフをクリックするとスタッフ詳細ページに遷移します。管理者アカウントにログインした状態だとスタッフの情報を「編集」するボタンと「削除」するボタンが出現し、通常アカウントにログインした状態だと「指名して予約」ボタンが出現します。「指名して予約」をクリックしますと予約ページに遷移します。

4. 予約日と配達先住所を入力して「送信」を押すと予約完了メールが登録したメールアドレスに送られ、そのあと決済方法確認ページに遷移します。このページではすでにクレジットカードを登録している場合は「クレジットでのお支払いをご希望のお客様はこちらから 購入を確定」の文字が現れ、クレジットカードの登録が済んでいない場合は「クレジットカードの登録がお済みでない方はこちらからご登録ください カード登録」の文字が現れます。前者の場合には「購入を確定」を押すことで決済が完了し、後者の場合は一度クレジットカード登録画面に遷移し、登録後に再び決済方法確認ページに帰ってきますのでそこで「購入を確定」を押すことで決済が完了します。

5. 管理者はヘッダー左の「予約確認」をクリックすることでカレンダー形式で予約状況を確認できます、さらにユーザーの名前をクリックすることで、配達日時、配達先住所、そして電話番号を確認することができます。

6. トップページヘッダーにはスタッフの名前を検索できるバーが設けてあります。


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



