FROM rails:latest
MAINTAINER Dima Rogov <navydimka@gmail.com>

RUN mkdir /rails-app
WORKDIR /rails-app

COPY Gemfile /rails-app
COPY Gemfile.lock /rails-app
RUN bundle install

COPY docker-entrypoint.sh /rails-app
ENTRYPOINT ["/rails-app/docker-entrypoint.sh"]

ENV RAILS_ENV development

EXPOSE 3000
