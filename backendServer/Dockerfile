# ref
# https://www.tohoho-web.com/docker/dockerfile.html
# https://www.wakuwakubank.com/posts/270-docker-build-image/

# https://hub.docker.com/_/ruby
FROM ruby:3.1 AS ruby_build

# Explicitly STDOUT that an image is being built
RUN echo "now building..."

# Obtaining the required packages 
# RUN apt update -qq && apt install -y postgresql-client
RUN apt update -qq && apt install -y --no-cache --no-install-recommends vim

# Make Rails app's folder
RUN mkdir /rails
# Move to Rails folder in the container
WORKDIR /rails

# Copy the some file's that exists on the host machine to the container.
COPY Gemfile /rails/Gemfile
COPY Gemfile.lock /rails/Gemfile.lock

# Install Ruby Gem's in Host machine
RUN bundle install
COPY . /rails



# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh

# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # コンテナ起動時に実行するコマンド。
# CMD ["rails", "server", "-b", "0.0.0.0"]