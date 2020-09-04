# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| shipping_region_id     | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| users_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buys

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| users_id        | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :credit_cards
- has_one :shippings

## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buys_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :buys



* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
