FROM ruby:2.6.3-alpine
ENV LANG C.UTF-8

# 作業ディレクトリの作成、設定
RUN mkdir /app_name 
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

# chromedriver
RUN apk add --update \
            udev \
            ttf-freefont \
            chromium \ 
            chromium-chromedriver

# 各種ファイルの設定
RUN apk add git --no-cache && \
    apk add --update bash perl --no-cache && \
    apk add libxslt-dev libxml2-dev build-base --no-cache && \
    apk add mysql-client mysql-dev --no-cache && \
    apk add --no-cache file && \
    apk add yarn --no-cache && \
    apk add tzdata --no-cache && \
    apk --update add imagemagick --no-cache

COPY . /$app_name

RUN bundle install && \
    yarn install

RUN mkdir -p /app_name/tmp/sockets /app_name/tmp/pids