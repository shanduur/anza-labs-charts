{{/*
Expand the name of the chart.
*/}}
{{- define "podvm.name" -}}
    {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "podvm.fullname" -}}
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
{{- define "podvm.chart" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "podvm.labels" -}}
helm.sh/chart: {{ include "podvm.chart" . }}
{{ include "podvm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "podvm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "podvm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Kernel Dir
*/}}
{{- define "podvm.kernelDir" -}}
  {{- $path := (index .Values.config "boot-source") -}}
  {{- with $path }}
    {{- $parts := regexSplit "/" .kernel_image_path -1 -}}
    {{- $dir := join "/" (slice $parts 0 (sub (len $parts) 1)) -}}
    {{- $dir -}}
  {{- end }}
{{- end -}}

{{/*
Rootfs Dir
*/}}
{{- define "podvm.rootfsDir" -}}
  {{- $path := (index .Values.config.drives 0 ) -}}
  {{- with $path }}
    {{- $parts := regexSplit "/" .path_on_host -1 -}}
    {{- $dir := join "/" (slice $parts 0 (sub (len $parts) 1)) -}}
    {{- $dir -}}
  {{- end }}
{{- end -}}
