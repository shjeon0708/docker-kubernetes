# 2일차 오전 — 도커 심화 실습 (볼륨 · Compose)

## 폴더 구성

| 폴더 | 내용 | 관련 슬라이드 |
|---|---|---|
| `counter-app/` | Flask + Redis 방문자 카운터 (Compose 첫 번째 예제) | 실습 ⑦ Compose 서비스 기동 |
| `wordpress-compose/` | 1일차 `--link`로 만든 워드프레스를 Compose로 재구성 (두 번째 예제) | 실습 ⑧ 어제 만든 WordPress를 Compose로 |

## 실행 방법

### counter-app
```bash
cd counter-app
docker compose up -d
curl http://localhost:8000     # 새로고침마다 카운트 증가
docker compose ps
docker compose down
```

### wordpress-compose
```bash
cd wordpress-compose
docker compose up -d
# 브라우저에서 http://<VM IP>:8000 접속
docker compose down
```

## 핵심 비교
1일차에는 `--link wpdb:db` 옵션으로 컨테이너를 연결했지만, Compose에서는 같은 파일 안에 있으면 **서비스 이름(`db`)만으로 자동 통신**됩니다. `wordpress-compose/compose.yml`의 `WORDPRESS_DB_HOST: db`가 이 서비스명을 그대로 사용하는 부분입니다.

## 참고
- 볼륨 관련 명령어(`docker volume create`, `--volumes-from` 등)는 파일이 아니라 CLI 명령이므로 이 저장소에는 별도 파일이 없습니다. PPT의 "실습 — 호스트 경로 직접 지정 방식", "실습 — 다른 컨테이너와 볼륨 공유하기" 슬라이드를 참고하세요.
