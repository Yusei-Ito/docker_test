FROM ubuntu:22.04

# パッケージ更新と基本ツールのインストール
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /app

# ソースコードをコンテナにコピー
COPY . /app

# Python依存関係をインストール（requirements.txtがある場合）
RUN pip3 install --no-cache-dir -r requirements.txt

# デフォルトコマンド
CMD ["python3", "main.py"]
