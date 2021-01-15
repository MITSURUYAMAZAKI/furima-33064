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
<!-- | image             | image   | null: false       | active_storage導入時に自動でテーブルなどが生成される為削除-->
| item_name         | string  | null: false       |
| explain           | text    | null: false       |
| category          | integer | null: false       |
| fee               | integer | null: false       |
| from              | integer | null: false       |
| shipping_dur.     | integer | null: false       |
| price             | integer | null: false       |

### Association

- belongs_to :user
- has_one :ship

## purchase table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| expiration        | date    | null: false       |
| security_code     | string  | null: false       |

### Association
- belongs_to :user
- belongs_to :item

## ship table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| zip_code          | string  | null: false       |
| prefecture        | integer | null: false       |  <!-- active hash を使う -->
| city              | string  | null: false       |
| address           | string  | null: false       |
| building_name     | string  |
| phone_number      | string  | null: false       |

### Association

- belongs_to :purchase

<!-- ## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user  -->
