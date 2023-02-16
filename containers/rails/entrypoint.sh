#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

# このコマンドは何度も実行されると困る（本番アプリケーションの初回起動時のみ実行したい）ため、何か対応方法を検討する。
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

exec "$@"