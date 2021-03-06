# テーブル設計

## users テーブル

| Column              | Type   | Options                       |
| ------------------- | ------ | ----------- ----------------- |
| nickname            | string | null: false, unique: true |
| email               | string | null: false, uniqueness: true |
| encrypted_password  | string | null: false                   |
| family_name         | string | null: false                   |
| first_name          | string | null: false                   |
| family_name_ruby    | string | null: false                   |
| first_name_ruby     | string | null: false                   |
| birth_date          | date   | null: false                   |

### Association

has_many :items
has_many :orders


## items テーブル

| Column           | Type   | Options                         |
| ---------------- | ------ | ------------------------------- |
| name             | string | null: false                     |
| introduction     | text   | null: false                     |
| price            | integer| null: false                     |
| category_id      | integer| null: false                     |
| condition_id     | integer| null: false                     |
| postage_id       | integer| null: false                     |
| shipping_days_id | integer| null: false                     |
| prefecture_id    | integer| null: false                     | 
| user             | integer| null: false, foreign_key: true  |

### Association

belongs_to :user
has_one    :order


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

## Association

belongs_to :user
has_one    :item
has_one    :shipping_address

attr_accessor :token



## shipping_address テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | integer    | null: false                   |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                   |
| house_number    | string     | null: false                   |
| building        | string     |                   |
| phone_number    | string     | null: false                   |
| order           | reference  | null: false, foreign_key: true|


### Association

belongs_to :order