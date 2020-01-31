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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many: gifts
- has_many: groups, through: history_good__tag
- has_many: history_good__tag


## giftsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category|text|null: false|
|state|text|null: false|

### Association
- has_many: users, through: history_good__tag
- has_many: ships
- has_many: images
- has_many: history_good__tag


## ships
|Column|Type|Options|
|------|----|-------|
|gift_id|integer|null: false|
|charge|integer|null: false|
|sender|string|null: false|
|days_to_ship|integer|null: false|
|state|text|null: false|

### Association
- belongs_to :gift

## images
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|gift_id|integer|null:false|

### Association
- belomgs_to: gift

## history_good__tag
|Column|Type|Options|
|------|----|-------|
|gift_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|created_at|date||
|good_at|date||

### Association
- brlongs_to: gift
- belomgs_to: user