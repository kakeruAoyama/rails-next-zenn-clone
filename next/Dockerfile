FROM oven/bun

# ユーザーの作成
RUN useradd -m myuser

# /app ディレクトリの作成と権限変更
RUN mkdir /app && chown myuser:myuser /app

USER myuser

WORKDIR /app
CMD ["tail", "-f", "/dev/null"]
