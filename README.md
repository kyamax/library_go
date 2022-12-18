# README

# アプリケーション名
Library Go<br>

# アプリケーションの概要
児童・生徒が日々の読書活動の記録を投稿し、ユーザー同士で読書記録を共有し合うSNSアプリケーション。読書の記録・蓄積や他のユーザーとの関わりを通して、本に親しむ。<br>
## ターゲット
学校等、教育機関

## ユーザー
児童・生徒・学校の教員

# URL
https://library-go.onrender.com/

# テスト用アカウント
## 児童・生徒
学年：1<br>
クラス：1<br>
番号：1<br>
パスワード：123qwe<br>

## 教員
職員番号：123qwe<br>
パスワード：123qwe<br>

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

## 教員
### おすすめの本の投稿
- トップページから先生の登録画面に遷移し、必要情報を入力する。<br>
- 「投稿する」ボタンから読んだ本の情報（本の名前、著者、カテゴリ、画像、感想）を入力し投稿する。<br>

### 投稿の管理
- 自分の投稿だけでなく、児童・生徒の投稿の削除を行うことができる。<br>

# アプリケーションを作成した背景
小学校の教員時代、児童の読書活動への意欲の低下が課題となっていた。課題に対する意識調査を行った結果、「何を読んでいいかわからない」、「周りがどのような本を読んでいるわかるといい」という意見が多く挙がり、本を読むきっかけが不足していると考えた。そこで、「本を読むきっかけづくり」になるために、読書記録を共有することができるSNSアプリケーションがあると読書活動へ前向きに取り組むことができる児童が増加すると仮説を立て、本アプリケーションの開発をすることにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1GdVTthVhNDcZ6dBf6pq6gxhJRudcDBzzxS9WgXnuxLo/edit?usp=sharing

# 実装予定の機能
## 学校登録機能
- 学校の情報（都道府県、市区町村、学校）を登録する。
- 登録された学校の中から管理者が選択し、同学校内のみの管理を行う。児童もまた同学校内のみの児童の投稿が表示される。

## 管理者機能の充実
- 児童・生徒のパスワードなど、情報の編集を行うことができる機能。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a01dc09994f1a8722853f38bab9ddd7d.jpg)](https://gyazo.com/a01dc09994f1a8722853f38bab9ddd7d)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/992f1726c4aac8103935d5068d0fae05.jpg)](https://gyazo.com/992f1726c4aac8103935d5068d0fae05)

# 開発環境

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/kyamax/library_go<br>
% cd library_go<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント
## 制作背景
児童・生徒の読書離れを改善していくためのきっかけになるものとして、Library Goを考案した。ICT機器が全校に導入された現在、そして児童・生徒の興味・関心が高いICT機器を使わない手はないと考え、制作に至った。ICT機器のネットリテラシーの学習という点も踏まえて、管理者機能の実装が必須だと考えた。
## 機能の工夫
### 管理者機能の実装
- deviseにてユーザー機能・管理者機能を実装したが、複数のdeviseを扱うことでそれぞれのdeviseの設定が必要になり、苦戦した。
- 管理者ができること、児童・生徒ができることを洗い出した。
- デフォルトの設定では実装できなかったため、devise公式のgithubを読み込み、機能の実装に必要となる記述を模索した。<br>
※ 今後、ユーザーの削除機能の実装、学校ごとの管理機能の実装をしていく予定。
### UIの工夫
- ユーザーが小中学生を想定しているため、なるべくシンプルかつひと目でどのような機能があるのか分かるように見た目を整えた。
- 基本的にトップページからほとんどの機能が使用できるようにした。



# 各種テーブル図
## usersテーブル(devise)
|column            |type   |option     |
|------------------|-------|-----------|
|school            |string |null: false|
|grade_id          |integer|null: false|
|class_id          |integer|null: false|
|number_id         |integer|null: false|
|name              |string |null: false|
|encrypted_password|string |null: false|

### Association
has_many :books<br>
has_many :likes<br>

---

## adminsテーブル(devise)
|column            |type   |option     |
|------------------|-------|-----------|
|school            |string |null: false|
|employee_id       |integer|null: false|
|name              |string |null: false|
|encrypted_password|string |null: false|

### Association
has_many :books<br>
has_many :likes<br>

---

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
belongs_to :user<br>
belongs_to :admin<br>
has_many :likes<br>

---

## commentsテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|content           |text       |null: false                   |
|user              |references |null: false, foreign_key: true|
|book              |references |null: false, foreign_key: true|

### Association
belongs_to :user<br>
belongs_to :book<br>

---

## likesテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|book              |references |null: false, foreign_key: true|

### Association
belongs_to :user<br>
belongs_to :admin<br>
belongs_to :book<br>

---

## categoriesテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|genre             |integer    |null: false                   |

### Association
belongs_to :book<br>