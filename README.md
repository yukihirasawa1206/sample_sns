# README
このリポジトリは私のポートフォリオ用のリポジトリであり、簡単なSNS機能を持ったアプリケーションです。会員登録、認証機能、記事投稿機能、記事へのコメント、いいね、Bookmark、写真のアップロードが行えます。

* 各種バージョン
Ruby 2.4.1
Rails 5.1.4
RSpec 3.6
mysql 5.5.62
CirleCI version2.0

* 設定
Twitter,CloudinaryのAPIを使うため、アカウントの登録を済ませてください。
その後、rootディレクトリに.envファイルを作り、以下を追加をしてください。
#Twitter認証用APIキー
APP_ID = "YOUR API ID"
APP_SECRET = "YOUR API SECRET" 
#Cloudinary認証用の設定
CLOUDINARY_NAME = "YOUR CLOUDINARY NAME"
CLONDINARY_API_KEY = "YOUR API KEY"
CLOUDINARY_API_SECRET = "YOUR API SECRET KEY"
