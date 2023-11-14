FROM ruby:3.1.0

WORKDIR /usr/src/app

COPY . .
RUN bundle install

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"]