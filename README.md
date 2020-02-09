# README

## ROOMER
![スクリーンショット 2020-02-07 20 59 56](https://user-images.githubusercontent.com/49487779/74102337-0e8c5480-4b86-11ea-8788-c7c8cc1acaa4.png)
<br>部屋のインテリア共有サイトです。
<br>自分のこだわりの部屋を投稿し、コメントやいいねを通して、部屋のインテリアについて語り合うSNSになっております。
<br>お近くのインテリアショップを検索できる機能も備えております。

## 本番環境
https://roomer.work/

ログイン画面の「かんたんログイン」からテストユーザーでログインが可能です。

開発環境はdevelopブランチにあります。

## 機能一覧、使用gemなど
* CircleCIを用いたCI/CD機能(Capistrano)
* Rspecによる自動テスト機能
* ユーザー登録（確認メール送信）、ログイン機能、パスワード再発行メールなど（device）
* ユーザープロフィール画像アップロード、削除機能（active storage）
* 投稿機能(CRUD)
* ajaxを活用したユーザー間でのフォロー、フォロワー機能
* ツイート投稿機能(CRUD)
* ツイート画像投稿機能(carrierwave)
* ajaxを活用したいいね機能
* ツイートへのコメント機能
* ツイート一覧表示の際などのページネーション機能(kaminari)
* 投稿、ユーザー検索機能(ransack)
* 管理ユーザー機能（一般ユーザーのアカウントや投稿を削除可能）
* タグ機能(acts-as-taggable-on)
* レスポンシブデザイン(スマホサイズに対応)
* お近くのインテリアショップ検索機能(geocoder)

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* MYSQL 8.0.19
* Bootstrap
* Docker
* GitHub,Git
* Rspec
* Nginx
* Unicorn
* Capistrano
* AWS
  * VPC
  * EC2
  * RDS for MySQL 
  * SES
  * ALB
  * Route53
  * S3
  * ACM
* CircleCI

## テスト
* Rspec
  * 単体テスト（モデル）
  * 統合テスト（systemspec）

# AWSアーキテクチャ図
![スクリーンショット 2020-02-09 21 48 10](https://user-images.githubusercontent.com/49487779/74102340-13510880-4b86-11ea-86bb-8698a5c22059.png)
