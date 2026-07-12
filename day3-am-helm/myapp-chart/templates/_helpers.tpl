{{/* 공용 이름 헬퍼 */}}
{{- define "myapp-chart.fullname" -}}
{{ .Release.Name }}-web
{{- end -}}
