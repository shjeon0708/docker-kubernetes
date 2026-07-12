# 3일차 오전 — 쿠버네티스 심화 (Ingress · Helm)

## 폴더 구성

| 폴더 | 내용 | 관련 슬라이드 |
|---|---|---|
| `ingress/web-ing.yaml` | 도메인 기반 라우팅 규칙 | 실습 ②③ Ingress 규칙 작성·검증 |
| `myapp-chart/` | myapp을 위한 Helm 차트 (dev/prod 환경 분리) | 실습 ⑥~⑩ 차트 생성부터 롤백까지 |

## Ingress 실행 방법
```bash
# ingress-nginx 컨트롤러가 먼저 설치되어 있어야 합니다.
kubectl apply -f ingress/web-ing.yaml
curl -H 'Host: web.edu.local' http://<노드IP>:<컨트롤러 NodePort>
```

## Helm 차트 실행 방법
```bash
cd myapp-chart

# 문법 검증
helm lint .
helm template . -f values-dev.yaml

# dev 환경 설치
helm install myapp-dev . -f values-dev.yaml -n dev --create-namespace

# prod 환경 설치
helm install myapp-prod . -f values-prod.yaml -n prod --create-namespace

# 업그레이드 (replicaCount를 값으로 즉석 변경)
helm upgrade myapp-prod . -f values-prod.yaml --set replicaCount=5 -n prod

# 이력 확인 및 롤백
helm history myapp-prod -n prod
helm rollback myapp-prod 1 -n prod
```

## 참고
- `image.repository`의 `<계정>` 부분은 실제 본인의 GHCR 계정으로 바꿔야 이미지를 정상적으로 pull합니다. GHCR에 이미지가 없다면 `image.repository: nginx`, `image.tag: "1.25"` 처럼 공개 이미지로 바꿔서 실습하셔도 Helm 사용법 자체는 동일하게 확인됩니다.
- ConfigMap·Secret 실습(`kubectl create configmap/secret ...`)은 파일이 아니라 CLI 명령이므로 이 저장소에는 별도 파일이 없습니다. PPT의 "실습 ④ ConfigMap·Secret 생성과 주입" 슬라이드를 참고하세요.
