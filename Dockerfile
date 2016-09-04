FROM rails:latest
MAINTAINER Dima Rogov <navydimka@gmail.com>

RUN mkdir /rails-app
WORKDIR /rails-app

ADD docker-entrypoint.sh /rails-app
ENTRYPOINT ["/rails-app/docker-entrypoint.sh"]

EXPOSE 3000
