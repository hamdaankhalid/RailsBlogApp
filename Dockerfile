FROM ruby:2.6.3-slim
RUN apt-get update -qq \
  && apt-get install -y \
  # Needed for certain gems
  build-essential \
  # Others
  nodejs \
  vim-tiny \   
  libsqlite3-dev \
  # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
  /var/lib/apt \
  /var/lib/dpkg \
  /var/lib/cache \
  /var/lib/log

RUN mkdir /blog
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install
ADD . /blog

EXPOSE 3000

CMD bash -c "rm -f tmp/pids/server.pid && rails s -p 3000 -b '0.0.0.0'"
