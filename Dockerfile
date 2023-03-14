FROM ruby:3.2.0-alpine
# musl-dev - stdio.h
# libc6-compat ld-linux-aarch64.so.1
# tzdata
ENV BUILD_DEPS make nodejs g++ sassc libpq-dev musl-dev libc6-compat tzdata

RUN apk add --no-cache chromium-chromedriver chromium $BUILD_DEPS

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --retry 3

# make sure webdirvers won't download wrong version of chromedriver
RUN mkdir -p ~/.webdrivers/ \
  && chromedriver --version|cut -d" " -f2 > ~/.webdrivers/chromedriver.version \
  && ln -s `which chromedriver` ~/.webdrivers/

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
