# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| birthday   | string | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | text       | null: false                    |
| name                | string     | null: false                    |
| explanation         | string     | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| shipping_charges    | string     | null: false                    |
| shipping_region     | string     | null: false                    |
| days_until_shipping | string     | null: false                    |
| price               | integer    | null: false                    |
| users_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buys

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| users_id        | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |
| credit_cards_id | references | null: false, foreign_key: true |
| shippings_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :credit_cards
- belongs_to :shippings

## credit_cards テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ------------|
| card_number     | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |

### Association

- has_many :buys

## shippings テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ------------|
| postal_code   | string  | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- has_many :buys



* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
