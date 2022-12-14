# README

# アプリケーション名
Library go<br>

# アプリケーションの概要
児童・生徒が日々の読書活動の記録を投稿し、本と親しむ。<br>

# URL

# テスト用アカウント

# 利用方法
## 児童・生徒
### 読書記録
- トップページから児童・生徒の登録画面に遷移し、必要情報を入力する。<br>
- 「投稿する」ボタンから読んだ本の情報（本の名前、著者、カテゴリ、画像、感想）を入力し投稿する。<br>

### 本を見つける
- トップページに他の児童の読書記録が一覧が表示され、閲覧できる。<br>
- 気になる本に「気になる」ボタンを押して、マイページに保存される。<br>
- コメント機能で、本の感想を共有する。<br>
- 学年やクラスなど、読書記録の絞り込みができ、同年代の読書傾向を調べることができる。<br>
- 「おすすめ」ボタンを押すと、先生の投稿一覧に遷移し先生からのおすすめの本を閲覧できる。<br>

## 先生
### おすすめの本の投稿
- トップページから先生の登録画面に遷移し、必要情報を入力する。<br>
- 「投稿する」ボタンから読んだ本の情報（本の名前、著者、カテゴリ、画像、感想）を入力し投稿する。<br>

### 投稿の管理
- 自分の投稿だけでなく、児童・生徒の投稿の削除を行うことができる。<br>

# アプリケーションを作成した背景
小学校の教員時代、児童の読書活動への意欲の低下が課題となっていた。課題に対する調査を行った結果、「何を読んでいいかわからない」、「周りがどのような本を読んでいるわかるといい」という意見が多く挙がり、本を読むきっかけが不足していると考えた。そこで、「本を読むきっかけづくり」になるために、読書記録を共有することができるSNSアプリケーションがあると読書活動へ前向きに取り組むことができる児童が増加すると仮説を立て、本アプリケーションの開発をすることにした。

# 洗い出した要件

# 実装予定の機能
## 学校登録機能
- 学校の情報（都道府県、市区町村、学校）を登録する。
- 登録された学校の中から管理者が選択し、同学校内のみの管理を行う。児童もまた同学校内のみの児童の投稿が表示される。

## 管理者機能の充実
- 児童・生徒のパスワードや情報の編集を行うことができる。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a01dc09994f1a8722853f38bab9ddd7d.jpg)](https://gyazo.com/a01dc09994f1a8722853f38bab9ddd7d)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/992f1726c4aac8103935d5068d0fae05.jpg)](https://gyazo.com/992f1726c4aac8103935d5068d0fae05)

# 開発環境

# ローカルでの動作方法

# 工夫したポイント
## 制作背景
## 使用技術


## usersテーブル(devise)
|column            |type   |option     |
|------------------|-------|-----------|
|grade_id          |integer|null: false|
|class_id          |integer|null: false|
|number_id         |integer|null: false|
|name              |string |null: false|
|encrypted_password|string |null: false|

### Association
has_many :posts
has_many :likes


## booksテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|book_name         |string     |null: false                   | 
|author            |string     |null: false                   |
|publisher         |string     |                              |
|text              |text       |                              |
|user              |references |null: false, foreign_key: true|
|genre_id          |integer    |null: false                   |

### Association
belongs_to :user
has_many :likes

## commentsテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|content           |text       |null: false                   |
|user              |references |null: false, foreign_key: true|
|book              |references |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :book

## likesテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|book              |references |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :post

## categoriesテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|genre             |integer    |null: false                   |

### Association
belongs_to :book