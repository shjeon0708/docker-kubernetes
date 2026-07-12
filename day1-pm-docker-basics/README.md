# 1일차 오후 — 도커 기초 실습

## 폴더 구성

| 폴더 | 내용 | 관련 슬라이드 |
|---|---|---|
| `myapp/` | Dockerfile 실습용 Flask 웹앱 (기본 이미지 빌드) | 실습 ④~⑧ 이미지 빌드/실행 |
| `cowsay-dockerfile/` | `docker commit` 대신 Dockerfile+ENTRYPOINT로 만든 cowsay 이미지 | 실습 ⑧ ENTRYPOINT로 명령어 감추기 |
| `cmd-entrypoint-demo/` | CMD vs ENTRYPOINT 동작 차이 비교용 최소 예제 | 실습 ⑦ CMD vs ENTRYPOINT |
| `wordpress-run/` | `docker run` + `--link`로 워드프레스·MySQL 연동 | 실습 ⑩ 두 컨테이너 연동 서비스 |

## 실행 방법

### myapp — 나만의 이미지 빌드하기
```bash
cd myapp
docker build -t myapp:v1 .
docker run -d -p 5001:5000 --name app1 myapp:v1
curl http://localhost:5001
```

### cowsay-dockerfile
```bash
cd cowsay-dockerfile
docker build -t exam/cowsay-dockerfile .
docker run exam/cowsay-dockerfile "Hi"
```

### cmd-entrypoint-demo
```bash
cd cmd-entrypoint-demo
docker build -f Dockerfile.cmd -t t1 .
docker build -f Dockerfile.entry -t t2 .
docker run t1 echo 다른말   # CMD 전체가 교체됨
docker run t2 다른말        # ENTRYPOINT 뒤에 인자만 결합됨
```

### wordpress-run
```bash
cd wordpress-run
bash run-commands.sh
```

## 참고
- 레지스트리 push 실습(`docker push ghcr.io/...`)은 각자의 GitHub 계정이 필요하므로 이 저장소에는 포함하지 않았습니다. PPT의 "실습 ⑨·⑩ push/pull" 슬라이드를 참고하세요.
- `wordpress-run`의 `--link`는 레거시 방식입니다. 2일차 오전 `day2-am-volume-compose/wordpress-compose`에서 같은 서비스를 Docker Compose로 다시 만들어봅니다.
