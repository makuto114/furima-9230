# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| -------------       | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| encrypted_password  | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_ruby    | string | null: false |
| first_name_ruby     | string | null: false |
| birth_date          | date   | null: false |

### Association

has_many :items
has_many :orders
has_many :purchase_logs


## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| introduction  | text   | null: false |
| price         | integer|             |
| category      | string | null: false |

### Association

belongs_to :user
has_one    :order
has_one    :purchase_log


## orders テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| shipping_address| string | null: false |

## Association

belongs_to :user
has_one    :item
has_one    :shipping_address

attr_accessor :token


## purchase_log テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -----------------------------  |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :item


## shipping_address テーブル

| Column          | Type       | Options        |
| --------------- | ---------- | -------------- |
| postal_code     | integer    | null: false    |
| prefecture      | string     | null: false    |
| city            | string     | null: false    |
| house_number    | integer    | null: false    |
| building        | string     | null: false    |
| phone_number    | integer    | null: false    |


### Association

has_one :order