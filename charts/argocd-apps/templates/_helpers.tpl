{{/*
Expande o nome completo da aplicação
*/}}
{{- define "argocd-app.fullname" -}}
{{- default .Chart.Name .Values.appName | trunc 63 | trimSuffix "-" }}
{{- end }}
