# 실습: docker commit으로 만든 cowsay 이미지를
# Dockerfile + ENTRYPOINT로 다시 만들어 명령어를 감추기
#
# 빌드:  docker build -t exam/cowsay-dockerfile .
# 실행:  docker run exam/cowsay-dockerfile "Hi"

FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y cowsay fortune && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/games/cowsay"]
