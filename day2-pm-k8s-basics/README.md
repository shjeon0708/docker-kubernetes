# 2일차 오후 — 쿠버네티스 기초 실습 (Minikube)

## 사전 준비
```bash
minikube start --driver=docker
kubectl get nodes   # minikube 노드가 Ready 상태인지 확인
```

## 폴더 구성

| 파일 | 내용 | 관련 슬라이드 |
|---|---|---|
| `manifests/nginx-pod.yaml` | 첫 Pod 배포 실습 | 실습 ① 첫 Pod 배포 |
| `manifests/web-deploy.yaml` | Deployment로 3개 복제 배포 | 실습 ③ Deployment 배포, 실습 ④ 셀프 힐링, 실습 ⑤·⑥ 롤링업데이트·롤백 |
| `manifests/web-svc-internal.yaml` | ClusterIP 서비스 (내부 통신) | 실습 ⑦ ClusterIP로 내부 통신 |
| `manifests/web-svc.yaml` | NodePort 서비스 (외부 노출) | 실습 ⑧ NodePort로 외부 노출 |

## 실행 순서
```bash
cd manifests

# 1) Pod
kubectl apply -f nginx-pod.yaml
kubectl get pods -o wide
kubectl describe pod nginx-pod
kubectl delete -f nginx-pod.yaml

# 2) Deployment
kubectl apply -f web-deploy.yaml
kubectl get pods -o wide

# 셀프 힐링 실습: Pod 하나를 강제 삭제하고 자동 복구 관찰
kubectl delete pod <위 목록의 파드 이름 하나>
kubectl get pods -w

# 롤링 업데이트 · 롤백 실습
kubectl set image deployment/web web=nginx:1.27
kubectl rollout status deployment/web
kubectl rollout undo deployment/web

# 3) Service
kubectl apply -f web-svc-internal.yaml
kubectl apply -f web-svc.yaml
kubectl get svc
minikube service web-svc --url
```

## 정리
```bash
kubectl delete -f web-svc.yaml -f web-svc-internal.yaml -f web-deploy.yaml
kubectl get all
```
