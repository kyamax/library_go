# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
_6.0.0_

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル(devise)
|column            |type   |option     |
|------------------|-------|-----------|
|grade             |integer|null: false|
|class             |integer|null: false|
|number            |integer|null: false|
|name              |string |null: false|
|encrypted_password|string |null: false|

### Association
has_many :posts
has_many :likes


## postsテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|book_name         |string     |null: false                   | 
|author            |string     |null: false                   |
|publisher         |string     |                              |
|text              |text       |                              |
|user              |references |null: false, foreign_key: true|

### Association
belongs_to :user
has_many :likes

## likeテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|post              |references |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :post

