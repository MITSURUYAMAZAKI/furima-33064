# DB 設計

## users table

| Column            | Type      | Options         |
|-------------------|-----------|-----------------|
| nick_name         | string    | null: false     |
| email             | string    | null: false     |
| password          | string    | null: false     |
| name              | string    | null: false     |
| name_kana         | string    | null: false     |
| birthday          | text      | null: false     |

### Association

* has_many :items
* has_many :comments

## items table

| Column            | Type    | Options           |
|-------------------|---------|-------------------|
| image             | image   | null: false       |
| item_name         | string  | null: false       |
| explain           | text    | null: false       |
| category          | string  | null: false       |
| fee               | string  | null: false       |
| from              | string  | null: false       |
| shipping_dur.     | integer | null: false       |
| price             | integer | null: false       |



### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user 
