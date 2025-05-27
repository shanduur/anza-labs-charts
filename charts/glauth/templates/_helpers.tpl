{{/*
Expand the name of the chart.
*/}}
{{- define "glauth.name" -}}
    {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "glauth.fullname" -}}
    {{- if .Values.fullnameOverride }}
        {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
    {{- else }}
        {{- $name := default .Chart.Name .Values.nameOverride }}
        {{- if contains $name .Release.Name }}
            {{- .Release.Name | trunc 63 | trimSuffix "-" }}
        {{- else }}
            {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
        {{- end }}
    {{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "glauth.chart" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "glauth.labels" -}}
helm.sh/chart: {{ include "glauth.chart" . }}
{{ include "glauth.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "glauth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "glauth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "glauth.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create }}
        {{- default (include "glauth.fullname" .) .Values.serviceAccount.name }}
    {{- else }}
        {{- default "default" .Values.serviceAccount.name }}
    {{- end }}
{{- end }}

{{/*
Create config map name used for configuring glauth.
*/}}
{{- define "glauth.config" -}}
    {{- default (printf "%s" (include "glauth.fullname" .)) .Values.config.name }}
{{- end }}

{{/*
Create backup secret name used for configuring Litestream.
*/}}
{{- define "glauth.backupSecret" -}}
    {{- default (printf "%s-backup" (include "glauth.fullname" .)) .Values.secret.name }}
{{- end }}

{{/*
Create backup secret name used for configuring Litestream.
*/}}
{{- define "glauth.backupConfig" -}}
    {{- printf "%s-backup" (include "glauth.fullname" .) }}
{{- end }}
