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

-------------------------------------------------------
# users

## usersテーブル
|Column         |Type   |Options    |
|---------------|-------|-----------|
|nickname       |string |null: false|
|email          |string |null: false|
|password       |string |null: false|
|last_name      |string |null: false|
|first_name     |string |null: false|
|last_name_kana |string |null: false|
|first_name_kana|string |null: false|
|birth_day      |integer|null: false|
|telephone      |string |null: false|

### Association
- has_many: user_addreses
- has_many: shipper_regions
- has_many: creditcards
- has_many: sns_credentials
- has_many: todo_lists
- has_many: notices
- has_many; evaluations
- has_many: gifts, through: like_history_flags

## user_addresesテーブル
|Column       |Type   |Options    |
|-------------|-------|-----------|
|user_id      |integer|null: false|
|postal_code  |integer|-----------|
|province     |string |-----------|
|city         |string |-----------|
|adress       |string |-----------|
|building_name|string |-----------|

### Association
- belongs_to: user


## creditcardsテーブル
|Column         |Type   |Options                       |
|---------------|-------|------------------------------|
|user_id        |integer|null: false, foreign_key: true|
|customer_id    |string |null: false                   |
|card_id        |string |null: false                   |

### Association
- belongs_to: user

## sns_credentials
|Column  |Type     |Options          |
|--------|---------|-----------------|
|user    |reference|foreign_key: true|
|uid     |integer  |-----------------|
|provider|integer  |-----------------|

### Association
- belongs_to: user

## todo_listsテーブル
|Column |Type   |Options    |
|-------|-------|-----------|
|user_id|integer|null: false|
|todo   |text   |-----------|

### Association
- belongs_to: user

## noticesテーブル
|Column |Type   |Options    |
|-------|-------|-----------|
|user_id|integer|null: false|
|notice |text   |-----------|

### Association
- belongs_to: user

## evaluationsテーブル
|Column      |Type   |Options|
|------------|-------|-------|
|user_id     |integer|-------|
|evaluration |text   |-------|
|evaluator_id|integer|-------|

### Association
- belongs_to: user

-------------------------------------------------------
# gifts

## giftsテーブル
|Column         |Type   |Options                       |
|---------------|-------|------------------------------|
|name           |string |null: false                   |
|description    |text   |null: false                   |
|charge_id      |integer|null: false                   |
|how_to_ship_id |integer|null: false                   |
|region_id      |integer|null: false                   |
|days_id        |integer|null: false                   |
|status_id      |integer|null: false                   |
|price          |integer|null: false                   |
|user_id        |integer|null: false                   |
|category_id    |integer|null: false                   |
|buyer_id       |integer|foreign_key: true             |
|listing_state  |integer|------------------------------|

### Association
- has_many: users, through: user_gift_parchases
- has_many: images
- has_one: category
- has_one: listing

## imagesテーブル
|Column |Type   |Options    |
|-------|-------|-----------|
|name   |string |null: false|
|gift_id|integer|null: false,foreign_key: true|

### Association
- belongs_to: gift

## categoryテーブル
|Column  |Type   |Options    |
|--------|-------|-----------|
|path    |integer|null: false|
|name    |string |null: false|
|ancestry|string |           |

### Association
- belongs_to : gift

# ER図
https://www.lucidchart.com/documents/edit/54f77995-ee91-4202-9faa-8ace71926ae4/0_0?shared=true