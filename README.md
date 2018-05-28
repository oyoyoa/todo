# README

## 参加者

* だいちゃん
* やよ
* うっちー
* あやや

----------------
### web初期化
  下記のコマンドは全て、todo/web ディレクトリに移動して、実行してください。

  * DBに初期データを投入
      初期データの内容は、todo/web/db/seed.rb に記載しています。
    $ rake db:migrate
    $ rake db:seed

  * テーブルを初期化したい場合
    $ rake db:migrate:reset
-----------------
### web起動コマンド
  下記のコマンドは全て、todo/web ディレクトリに移動して、実行してください。

  * サーバーの立ち上げ
    $ rails s
    * HTMLを返したい場合
    　http://localhost:3000/tasks　へアクセス
    * JSON形式で返したい場合
      http://localhost:3000/tasks.json　へアクセス
