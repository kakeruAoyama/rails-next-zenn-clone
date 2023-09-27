FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y vim

# ユーザーの作成とbundleのためのディレクトリ権限変更
RUN useradd -m myuser && \
    mkdir -p /usr/local/bundle && \
    chown myuser:myuser /usr/local/bundle

# /myapp ディレクトリの作成と権限変更
RUN mkdir /myapp && chown myuser:myuser /myapp

# entrypoint.shのコピーと権限変更をrootで実行
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# ここでユーザーを切り替える
USER myuser

WORKDIR /myapp
COPY --chown=myuser:myuser Gemfile /myapp/Gemfile
COPY --chown=myuser:myuser Gemfile.lock /myapp/Gemfile.lock

RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY --chown=myuser:myuser . /myapp

ENTRYPOINT ["entrypoint.sh"]
