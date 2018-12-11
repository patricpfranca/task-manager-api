FROM ruby:2.4.1

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq
RUN apt-get install -y --assume-yes apt-utils
RUN apt-get install -y --no-install-recommends build-essential libpq-dev nodejs imagemagick mysql-client

RUN mkdir /app

WORKDIR /app

RUN gem update --system
RUN gem install bundler

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install
