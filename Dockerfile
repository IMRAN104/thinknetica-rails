FROM rails:latest
MAINTAINER Dima Rogov <navydimka@gmail.com>

RUN mkdir /rails-app
WORKDIR /rails-app

EXPOSE 3000
