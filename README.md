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
| postal_code       | integer     | null: false                    |
| prefectures_id    | integer     | null: false                    |
| municipalities    | integer     | null: false                    |
| address           | integer     | null: false                    |
| building          | integer     | null: false                    |
| phone_number      | integer     | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

belongs_to: product

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| charge_id   | integer    | null: false                   | 
| days_id     | integer    | null: false                   |
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
| products    | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: product

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| products    | references | null: false, foreign_key: true |

belongs_to: user
belongs_to: product
