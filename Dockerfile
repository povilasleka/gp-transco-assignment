FROM ruby:3.1.0

WORKDIR /usr/src/app

COPY . .

RUN apt-get update && apt-get -y install cron
RUN bundle install
RUN RAILS_ENV=development bundle exec whenever --update-crontab

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"]