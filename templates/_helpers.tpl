{{- define "sample-app.name" -}}
{{ include "sample-app.chart" . }}
{{- end }}

{{- define "sample-app.chart" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "sample-app.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}
