FROM ruby:3.0

RUN apt-get update && apt-get install -y postgresql-client

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .