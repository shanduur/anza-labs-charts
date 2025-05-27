{{/*
Extra labels
*/}}
{{- define "hosted-control-plane.apiserver.labels" -}}
app.kubernetes.io/component: "kube-apiserver"
{{- end }}
