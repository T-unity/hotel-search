このリポジトリの使い方。

https://github.com/T-unity/hotel-search/commit/786b32c29fce04e5e72ac49d210675ed6bcc03d0
上記あたりまでのコミットを再現する。

DBの設定
https://github.com/T-unity/hotel-search/commit/41de3446cadd21e171e8bc88838ace61b0d52e92

基本Rails newした状態ままだが、以下のあたりを追加している。

```
  host: db
  socket: '/tmp/mysql.sock'
```

以下を実行。
APIモードでRailsを作成する。
docker compose run app rails new . --force --api -d mysql
