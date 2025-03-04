{{/*
Extra labels
*/}}
{{- define "hosted-control-plane.controller-manager.labels" -}}
app.kubernetes.io/component: "kube-controller-manager"
{{- end }}
