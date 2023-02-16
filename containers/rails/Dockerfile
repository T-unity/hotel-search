# https://hub.docker.com/_/ruby
FROM ruby:3.1 AS ruby_build

# Obtaining the required packages 
RUN apt update -qq && apt install -y --no-install-recommends vim

# Make Rails app's folder
RUN mkdir /myapp
# Move to myapp folder in the container
WORKDIR /myapp

# Copy the some file's that exists on the host machine to the container.
COPY Gemfile .
COPY Gemfile.lock .

# Install Ruby Gem's in Host machine
RUN gem install bundler
RUN bundle install --jobs=2

COPY . /myapp

COPY ./containers/rails/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# For Nginx container
RUN mkdir -p tmp/sockets
VOLUME /sample-app/public
VOLUME /sample-app/tmp

# Execute command
CMD ["sh", "./docker/web/start-server.sh"]
