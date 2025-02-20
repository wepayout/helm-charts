{{/*
Nome completo da aplicação
*/}}
{{- define "argocd-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Values.appName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Labels comuns para a aplicação
*/}}
{{- define "argocd-app.labels" -}}
{{- range $key, $value := .Values.labels }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}

{{/*
Gerar policy de sincronização opcional
*/}}
{{- define "argocd-app.syncPolicy" -}}
automated:
  prune: {{ .Values.syncPolicy.prune | default true }}
  selfHeal: {{ .Values.syncPolicy.selfHeal | default true }}
  {{- if .Values.syncPolicy.allowEmpty }}
  allowEmpty: {{ .Values.syncPolicy.allowEmpty }}
  {{- end }}
syncOptions:
  {{- range .Values.syncPolicy.syncOptions }}
  - {{ . }}
  {{- end }}
{{- end }}
