# CMD vs ENTRYPOINT 비교 실습 (1/2) — CMD만 사용
#
# 빌드:  docker build -f Dockerfile.cmd -t t1 .
# 실행:  docker run t1                # -> 기본 메시지
#        docker run t1 echo 다른말    # -> CMD 전체가 교체되어 "다른말"만 출력

FROM busybox
CMD ["echo", "기본 메시지"]
