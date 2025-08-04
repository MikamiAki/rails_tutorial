FROM ruby:3.2.8

RUN apt-get update -qq && apt-get install -y nodejs npm default-mysql-client

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]