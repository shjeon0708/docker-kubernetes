#!/bin/bash
# 실습: docker run으로 두 컨테이너(MySQL + WordPress) 연동하기
# (--link는 레거시 방식 — 2일차 오전에 Docker Compose로 다시 만들어봅니다)

# 1) MySQL 컨테이너
docker run -d --name wpdb -v db_data:/var/lib/mysql \
  --restart=always \
  -e MYSQL_ROOT_PASSWORD=somewordpress \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=wordpress \
  mysql:5.7

# 2) WordPress 컨테이너 (위 MySQL 컨테이너를 --link로 연결)
docker run -d --name=wp -v wordpress_data:/var/www/html \
  --restart=always -p 8000:80 \
  -e WORDPRESS_DB_HOST=db \
  -e WORDPRESS_DB_USER=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpress \
  -e WORDPRESS_DB_NAME=wordpress \
  --link wpdb:db wordpress

# 3) 확인
docker ps
echo "브라우저에서 http://<VM IP>:8000 접속해서 워드프레스 초기화면을 확인하세요."

# 정리하려면:
# docker rm -f wp wpdb
