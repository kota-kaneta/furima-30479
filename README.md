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

--has_many: products,comments
--has_one: birthday,purchase

## birthdays テーブル

| Column   | Type | Options     |
| -------- | ---- | ----------- |
| birthday | date | null: false |

--belongs_to :user

## Shippings テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| Postal_code_id    | integer     | null: false                    |
| Prefectures_id    | integer     | null: false                    |
| Municipalities_id | integer     | null: false                    |
| address_id        | integer     | null: false                    |
| building          | integer     | null: false                    |
| phone_number_id   | integer     | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

belongs_to: product

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| charge_id   | integer     | null: false                   | 
| days_id     | integer     | null: false                   |
| source_id   | integer    | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

belongs_to: user
has_many: comments
has_one: purchase,shipping,

## purchases テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| products    | references | null: false, foreign_key: true |

belongs_to: products

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| products    | references | null: false, foreign_key: true |

belongs_to: user,product
