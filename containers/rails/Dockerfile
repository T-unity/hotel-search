# ref
# https://www.tohoho-web.com/docker/dockerfile.html
# https://www.wakuwakubank.com/posts/270-docker-build-image/

# https://hub.docker.com/_/ruby
FROM ruby:3.1 AS ruby_build

# Obtaining the required packages 
# RUN apt update -qq && apt install -y postgresql-client
# RUN apt update -qq && apt install -y --no-cache --no-install-recommends vim # no-cacheできない
RUN apt update -qq && apt install -y --no-install-recommends vim

# Make Rails app's folder
RUN mkdir /myapp
# Move to myapp folder in the container
WORKDIR /myapp

# Copy the some file's that exists on the host machine to the container.
# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock
COPY Gemfile .
COPY Gemfile.lock .

# Install Ruby Gem's in Host machine
# RUN bundle install
RUN gem install bundler
RUN bundle install --jobs=2

COPY . /myapp

# COPY entrypoint.sh /usr/bin/
COPY ./containers/rails/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 3000番ポートを開ける必要がない。
# EXPOSE 3000
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

CMD ["sh", "./docker/web/start-server.sh"]
