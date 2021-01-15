# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| real_name     | string | null: false |
| furigana      | string | null: false |
| birth_date    | integer| null: false |

### Association

has_many: items
has_many: orders


## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| introduction  | text   | null: false |
| price         | integer|             |

### Association

belongs_to :user
has_one    :order

## orders テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| shipping_address| string | null: false |

## Association

belongs_to :user
has_one    :item

attr_accessor :token