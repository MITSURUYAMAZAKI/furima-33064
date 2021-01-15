# DB 設計

## users table

| Column            | Type     | Options         |
|-------------------|----------|-----------------|
| nick_name         | string   | null: false     |
| email             | string   | null: false, unique: true |
| encrypted_password| string   | null: false     |
| family_name       | string   | null: false     |
| first_name        | string   | null: false     |
| family_name_kana  | string   | null: false     |
| first_name_kana   | string   | null: false     |
| birthday          | date     | null: false     |

### Association

- has_many :items
- has_many :purchases

## items table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| name              | string  | null: false       |
| explain           | text    | null: false       |
| category.id       | integer | null: false       |
| condition.id      | integer | null: false       |
| fee.id            | integer | null: false       |
| prefecture.id     | integer | null: false       |
| shipping_dur.id   | integer | null: false       |
| price             | integer | null: false       |

### Association

- belongs_to :user
- has_one :ship

## purchase table

| Column            | Type    | Options                   |
|-------------------|---------|---------------------------|
| email             | string  | null: false, foreign_key: |
| name              | string  | null: false, foreign_key: |
<!-- 
＞購入管理テーブルに保存するのは、「誰が」「何の商品」を購入したかという情報ですので、
＞userとitemの外部キーのみをカラムとして準備しましょう。
いまいち意味がよくわかってないのですが、こういうことでよろしいのでしょうか？
 -->
### Association
- belongs_to :user
- belongs_to :item
- has_one :ship

## ship table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| zip_code          | string  | null: false       |
| prefecture.id     | integer | null: false       |
| city              | string  | null: false       |
| address           | string  | null: false       |
| building_name     | string  |
| phone_number      | string  | null: false       |
| email             | string  | null: false, foreign_key: |

### Association

- belongs_to :purchase

