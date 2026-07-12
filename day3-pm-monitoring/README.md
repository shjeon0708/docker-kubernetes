# 3일차 오후 — Prometheus·Grafana 모니터링 실습

## 폴더 구성

| 파일 | 내용 | 관련 슬라이드 |
|---|---|---|
| `myapp-servicemonitor.yaml` | myapp을 Prometheus 수집 대상에 추가 | 실습: 우리 앱도 모니터링 대상에 포함하기 |

## 사전 준비 (PART 1 실습)
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring --create-namespace
kubectl get pods -n monitoring
```

## ServiceMonitor 적용
```bash
kubectl apply -f myapp-servicemonitor.yaml
```

`namespaceSelector.any: true`가 있어 `myapp`이 `prod`나 `dev` 등 다른 네임스페이스에 있어도 Prometheus가 찾아낼 수 있습니다. `labels.release: monitoring`은 위에서 `helm install`할 때 사용한 릴리스 이름과 반드시 같아야 합니다. 릴리스 이름을 바꾸셨다면 이 값도 함께 바꿔주세요.

## Prometheus · Grafana 접속
```bash
# Prometheus
kubectl port-forward -n monitoring svc/monitoring-kube-prom-prometheus 9090:9090
# http://<VM IP>:9090 접속 후 Status > Targets 에서 myapp 확인

# Grafana
kubectl get secret monitoring-grafana -n monitoring \
  -o jsonpath='{.data.admin-password}' | base64 -d
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80
# http://<VM IP>:3000 접속 (admin / 위에서 확인한 비밀번호)
```

## 부하 테스트로 그래프 변화 관찰
```bash
kubectl run load-test --rm -it --image=busybox -- /bin/sh -c \
  "while true; do wget -qO- http://myapp.prod.svc.cluster.local; done"
```
Grafana 대시보드를 열어둔 채로 위 명령을 실행하면 CPU 사용량 그래프가 실시간으로 올라가는 것을 확인할 수 있습니다. `Ctrl+C`로 부하를 종료하세요.
