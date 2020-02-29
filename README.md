# README

## ROOMER
![roomer-top](https://user-images.githubusercontent.com/49487779/74103204-a7729e00-4b8d-11ea-9be7-03a3314a828e.png)

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
* ユーザー登録(確認メール送信)、ログイン機能、パスワード再発行メールなど(device)
* ユーザープロフィール画像アップロード、削除機能
* ajaxを活用したユーザー間でのフォロー、フォロワー機能
* ツイート投稿機能(CRUD)
* ツイート画像投稿機能(carrierwave)
* ajaxを活用したいいね機能
* ツイートへのコメント機能
* ツイートをtwitterへ共有する機能
* ツイート一覧表示の際などのページネーション機能(kaminari)
* 投稿、ユーザー検索機能(ransack)
* 管理ユーザー機能(一般ユーザーのアカウントや投稿を削除可能)
* タグ機能(acts-as-taggable-on)
* レスポンシブデザイン(スマホサイズに対応)
* 通知機能(「いいね」された時、フォローされた時)
* お近くのインテリアショップ検索機能(geocoder)

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* MYSQL 8.0.19
* Bootstrap
* Docker
* Git
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
  * 単体テスト(model)
  * 統合テスト(system)

# AWSアーキテクチャ図
![aws-architecher](https://user-images.githubusercontent.com/49487779/74103213-b9ecd780-4b8d-11ea-8ee6-90d775665f02.png)
