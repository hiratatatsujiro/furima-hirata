# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users table
| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :orders

## items table
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| name                | string     | null: false       |
| introduce           | text       | null: false       |
| category_id         | integer    | null: false       |
| status_id           | integer    | null: false       |
| pay_for_shopping_id | integer    | null: false       |
| delivery_area_id    | integer    | null: false       |
| day_to_ship_id      | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association
- belongs_to :user

## orders table
| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## buyers table
| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| delivery_area_id   | integer    | null: false       |
| city               | string     | null: false       |
| house_number       | string     | null: false       |
| building           | string     |                   |
| phone_number       | string     | null: false       |
| order              | references | foreign_key: true | 
### Association
- belongs_to :order