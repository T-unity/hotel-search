## 参照

以下のあたりが良さそう。

https://itoka.hatenadiary.com/entry/2022/03/04/004453

## このリポジトリの使い方。

https://github.com/T-unity/hotel-search/commit/786b32c29fce04e5e72ac49d210675ed6bcc03d0
上記あたりまでのコミットを再現する。

DBの設定
https://github.com/T-unity/hotel-search/commit/41de3446cadd21e171e8bc88838ace61b0d52e92

基本Rails newした状態ままだが、以下のあたりを追加している。

```
  host: db
  socket: '/tmp/mysql.sock'
```

このリポジトリをcloneしてきた状態だと、.gitignoreされているファイルが欠けているので注意が必要。
例えば、git cloneした状態でdocker-compose run app bin/rails db:createを実行すると、/tmp/mysql.sockが存在しないためDBの作成に失敗する。

以下を実行。
APIモードでRailsを作成する。
docker compose run app rails new . --force --api -d mysql

## ビルドメモ

以下のエラーが結構出る。
Makefileを使ってビルドを試みると失敗するが、全コンテナを起動した状態で $ docker-compose run app bin/rails db:create を実行するとDBの作成に成功した。

```
Can't connect to MySQL server on 'db' (115)
Couldn't create 'myapp_development' database. Please check your configuration.
rails aborted!
ActiveRecord::ConnectionNotEstablished: Can't connect to MySQL server on 'db' (115)
/myapp/bin/rails:4:in `require'
/myapp/bin/rails:4:in `<main>'

Caused by:
Mysql2::Error::ConnectionError: Can't connect to MySQL server on 'db' (115)
/myapp/bin/rails:4:in `require'
/myapp/bin/rails:4:in `<main>'
Tasks: TOP => db:create
(See full trace by running task with --trace)
```
