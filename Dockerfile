# Dockerfile
# gets the docker parent image
FROM ruby:3.2.0

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install
RUN bundle exec rake db:create
RUN bundle exec rake db:setup

CMD rails s -b 0.0.0.0
