# テーブル設計

## users テーブル 

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_ruby       | string  | null: false |
| last_name_ruby        | string  | null: false |
| birthday              | date    | null: false |

has_many: comments
has_many: products
has_one: purchase
 
## Shippings テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| postal_code       | string      | null: false                    |
| prefectures_id    | integer     | null: false                    |
| municipalities    | string      | null: false                    |
| address           | string      | null: false                    |
| building          | string      |                                |
| phone_number      | string      | null: false                    |
| order             | references  | null: false, foreign_key: true |

belongs_to: product
has_one: purchase

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| charge_id   | integer    | null: false                    | 
| days_id     | integer    | null: false                    |
| source_id   | integer    | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

belongs_to: user
has_many: comments
has_one: purchase

## purchases テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: product
belongs_to: shipping

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: product
