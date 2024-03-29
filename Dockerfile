FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /railsApp
WORKDIR /railsApp
COPY Gemfile /railsApp/Gemfile
COPY Gemfile.lock /railsApp/Gemfile.lock
RUN bundle install
COPY . /railsApp
#EXPOSE 3000
RUN rails db:migrate
# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]
