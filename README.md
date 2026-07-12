# 도커와 쿠버네티스 실무 교육 — 실습 코드 저장소

건강보험공단 IT부서 도커·쿠버네티스 3일 교육과정의 실습 코드 모음입니다.
각 폴더는 강의 PPT의 세션(일차·오전/오후)과 1:1로 대응하며, 슬라이드에서 다룬 실습 코드를 그대로 따라 치고 실행해볼 수 있도록 완성된 형태로 제공합니다.

## 전체 구성

| 폴더 | 세션 | 핵심 내용 |
|---|---|---|
| `day1-pm-docker-basics/` | 1일차 오후 | Dockerfile 작성, 이미지 빌드, CMD/ENTRYPOINT |
| `day2-am-volume-compose/` | 2일차 오전 | Docker Compose (카운터 앱, 워드프레스) |
| `day2-pm-k8s-basics/` | 2일차 오후 | Pod · Deployment · Service (Minikube) |
| `day3-am-helm/` | 3일차 오전 | Ingress, Helm 차트 (dev/prod 환경 분리) |
| `day3-pm-monitoring/` | 3일차 오후 | Prometheus · Grafana 모니터링 |

1일차 오전은 이론 세션이라 실습 코드가 없어 이 저장소에는 포함되지 않았습니다.

## 사용 방법

1. 이 저장소를 실습 VM에 클론합니다.
   ```bash
   git clone <이 저장소의 GitHub 주소> docker-k8s-training
   cd docker-k8s-training
   ```
2. 진행 중인 세션의 폴더로 이동해 그 폴더의 `README.md`를 먼저 읽습니다.
3. 각 폴더의 안내에 따라 명령을 실행합니다.

## 사전 요구사항
- 1일차 오후: Docker 설치 완료
- 2일차 오후부터: Minikube 클러스터 실행 중 (`minikube start --driver=docker`)
- 3일차 오전: Helm 설치 완료

## 참고
- 일부 실습(레지스트리 push, ConfigMap/Secret 생성, 볼륨 명령 등)은 파일이 아니라 CLI 명령 자체가 학습 내용이므로 이 저장소에는 포함되지 않았습니다. 해당 부분은 각 세션 PPT와 강의 스크립트를 참고하세요.
- `<계정>`, `ghcr.io/<계정>/...` 형태로 되어 있는 부분은 실습자 본인의 GitHub 계정 또는 이미지 저장소 주소로 바꿔서 사용해야 합니다.
