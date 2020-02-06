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
|profile        |text   |-----------|
|postal_code    |integer|-----------|
|province       |string |-----------|
|city           |string |-----------|
|adress         |string |-----------|
|building_name  |string |-----------|
|phone_number   |integer|-----------|

### Association
- has_many: user_adress
- has_many: creditcard
- has_many: sns_credentials
- has_many: gifts
- has_many: gifts, through: good_tag
- has_many: good_tag
- has_many: gifts, through: history_tag
- has_many: history_tag

## shipper_regionテーブル
|Column       |Type   |Options    |
|-------------|-------|-----------|
|user_id      |integer|null: false|
|postal_code  |integer|-----------|
|province     |string |-----------|
|city         |string |-----------|
|adress       |string |-----------|
|building_name|string |-----------|
|phone_number |integer|-----------|

### Association
- belongs_to: user

## creditcardテーブル
|Column         |Type   |Options    |
|---------------|-------|-----------|
|user_id        |integer|null: false|
|card_number    |integer|null: false|
|expiration_date|integer|null: false|
|security_code  |integer|null: false|

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
|Column|Type|Options|
|------|----|-------|
|todo  |text|-------|

### Association
- belongs_to: user

## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|text|-------|

### Association
- belongs_to: user

## evaluationテーブル
|Column      |Type   |Options|
|------------|-------|-------|
|evaluration |text   |-------|
|evaluator_id|integer|-------|

-------------------------------------------------------
# gifts

## giftsテーブル
|Column     |Type   |Options    |
|-----------|-------|-----------|
|name       |string |null: false|
|description|text   |null: false|
|category   |text   |null: false|
|state      |text   |null: false|
|price      |integer|null: false|

### Association
- has_many: users, through: good_tag
- has_many: users, through: history_tag
- has_many: ships
- has_many: images
- has_many: good_tag

## imagesテーブル
|Column |Type   |Options    |
|-------|-------|-----------|
|name   |string |null: false|
|gift_id|integer|null: false|

### Association
- belongs_to: gift

## shipsテーブル
|Column         |Type   |Options    |
|---------------|-------|-----------|
|gift_id        |integer|null: false|
|shipping_charge|integer|null: false|
|how_to_ship    |string |null: false|
|sender_region  |string |null: false|
|days_to_ship   |integer|null: false|

### Association
- belongs_to : gift

-------------------------------------------------------
#　中間テーブル

## good_tagテーブル
|Column  |Type   |Options                       |
|--------|-------|------------------------------|
|gift_id |integer|null: false, foreign_key: true|
|user_id |integer|null: false, foreign_key: true|
|good_tag|boolean|------------------------------|

### Association
- brlongs_to: gift
- belomgs_to: user

## history_tagテーブル
|Column     |Type   |Options                       |
|-----------|-------|------------------------------|
|gift_id    |integer|null: false, foreign_key: true|
|user_id    |integer|null: false, foreign_key: true|
|history_tag|boolean|------------------------------|
|created_at |date   |null:false                    |

### Association
- belongs_to: gift
- belomgs_to: user

## listingテーブル
|Column   |Type   |Options                       |
|---------|-------|------------------------------|
|gift_id  |integer|null: false, foreign_key: true|
|buyer_id |integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|state    |string |------------------------------|

### Association
- brlongs_to: gift
- belomgs_to: user

# ER図
https://www.lucidchart.com/documents/edit/54f77995-ee91-4202-9faa-8ace71926ae4/0_0?shared=true