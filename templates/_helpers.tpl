{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "custom-job.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "custom-job.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "custom-job.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "custom-job.labels" -}}
app.kubernetes.io/name: {{ include "custom-job.name" . }}
helm.sh/chart: {{ include "custom-job.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
Pod labels
*/}}
{{- define "custom-job.podLabels" -}}
app.kubernetes.io/name: {{ include "custom-job.name" . }}
helm.sh/chart: {{ include "custom-job.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}


{{/*
Define resource names
*/}}
{{- define "custom-job.namespace" }}
{{- default (printf "%s" .Release.Namespace) -}}
{{- end }}

{{- define "custom-job.serviceAccount" }}
{{- default (printf "%s-account" .Release.Name) -}}
{{- end }}

{{- define "custom-job.role" }}
{{- default (printf "%s-role" .Release.Name) -}}
{{- end }}

{{- define "custom-job.roleBinding" }}
{{- default (printf "%s-rolebinding" .Release.Name) -}}
{{- end }}

{{- define "custom-job.job" }}
{{- default (printf "%s-job" .Release.Name) -}}
{{- end }}

{{- define "custom-job.cronJob" }}
{{- default (printf "%s-cron" .Release.Name) -}}
{{- end }}

{{- define "custom-job.secret" }}
{{- default (printf "%s-secret" .Release.Name) -}}
{{- end }}

{{- define "custom-job.configmap" }}
{{- default (printf "%s-configmap" .Release.Name) -}}
{{- end }}