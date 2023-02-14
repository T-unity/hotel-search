# FROM nginx:alpine

# # インクルード用のディレクトリ内を削除
# RUN rm -f /etc/nginx/conf.d/*

# # Nginxの設定ファイルをコンテナにコピー
# ADD nginx.conf /etc/nginx/conf.d/myapp.conf

# # ビルド完了後にNginxを起動
# CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf


# https://itoka.hatenadiary.com/entry/2022/03/04/004453


FROM nginx:latest

# デフォルトで用意されている個別設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

COPY ./nginx.conf /etc/nginx/nginx.conf
# ADD ./nginx.conf /etc/nginx/nginx.conf

# Nginxをforeground起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
