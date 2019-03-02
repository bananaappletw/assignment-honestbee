FROM ruby:2.6.0-alpine

RUN apk add --update \
  build-base \
  sqlite-dev \
  nodejs \
  yarn \
  tzdata \
  imagemagick \
  && rm -rf /var/cache/apk/*

RUN gem update --system
RUN gem install bundler

WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

ENV RACK_ENV=production
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV DISABLE_DATABASE_ENVIRONMENT_CHECK=1

COPY config/master.key.example /app/config/master.key
COPY . /app

RUN bundle exec rake assets:precompile
RUN bundle exec rake db:reset

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
