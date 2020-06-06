FROM ruby:latest
LABEL maintainer="ngzm<nk.ngzm@gmail.com>"

# setup apt
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y apt-transport-https

# install nodejs and yarn which is required by rails
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install -y curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# install sqlite3
RUN apt-get install -y sqlite3

# setup glink application
ADD ./glink /usr/src/app/
RUN mkdir -p /usr/src/app/database
RUN mkdir -p /usr/src/app/tmp/sockets /usr/src/app/tmp/pids
RUN cd /usr/src/app && bundle install --without test development

# define production environments
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES 1
ENV SECRET_KEY_BASE ed823e9dab4761a303585f5b5fa68e82bbe7edfc2ca5b71f327b86cad1f6ebbc0a030da9222b301a41f95cfd0413a49a0903bb50b71bb3192103c8ad2853ceb7
## ENV SECRET_KEY_BASE __set_your_secret_key_base__

# setup glink application
RUN cd /usr/src/app && rails assets:precompile

# start glink application
EXPOSE 3000
WORKDIR /usr/src/app
CMD ["puma", "-C", "config/puma.rb"]
