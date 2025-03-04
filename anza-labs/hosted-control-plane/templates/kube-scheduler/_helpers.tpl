{{/*
Extra labels
*/}}
{{- define "hosted-control-plane.scheduler.labels" -}}
app.kubernetes.io/component: "kube-scheduler"
{{- end }}
