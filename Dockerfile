FROM ruby:2.5.7-slim

# working on corporate computer lolol. remove if you're a regular human being
ENV HTTP_PROXY http://fastweb.int.bell.ca:80
ENV HTTPS_PROXY http://fastweb.int.bell.ca:80
ENV http_proxy http://fastweb.int.bell.ca:80
ENV https_proxy http://fastweb.int.bell.ca:80

RUN apt update --allow-releaseinfo-change && apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev libsqlite3-dev nodejs libcurl4 curl postgresql-client libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]