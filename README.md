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
| category_id       | integer | null: false       |
| condition_id      | integer | null: false       |
| fee_id            | integer | null: false       |
| prefecture_id     | integer | null: false       |
| shipping_dur_id   | integer | null: false       |
| price             | integer | null: false       |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship

## ship table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| zip_code          | string  | null: false       |
| prefecture_id     | integer | null: false       |
| city              | string  | null: false       |
| address           | string  | null: false       |
| building_name     | string  |
| phone_number      | string  | null: false       |
| purchase          | references | null: false, foreign_key: |

### Association

- belongs_to :purchase

