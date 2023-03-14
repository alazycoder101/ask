FROM ruby:3.2.0-alpine
# musl-dev - stdio.h
# libc6-compat ld-linux-aarch64.so.1
ENV BUILD_DEPS make nodejs g++ sassc libpq-dev musl-dev libc6-compat
#ENV BUILD_DEPS cmake autoconf automake libtool binutils gcc g++ libcurl font-noto make libexecinfo-dev python3

RUN apk add --no-cache chromium $BUILD_DEPS

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --retry 3
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
