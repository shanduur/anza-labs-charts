# meta-chart

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat) ![AppVersion: meta](https://img.shields.io/badge/AppVersion-meta-informational?style=flat)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| namespaces | list | `[]` | List of Kubernetes namespaces to create |
| resources | list | `[]` | List of custom resources to deploy. Each item should define `apiVersion`, `kind`, `metadata`, and `spec` as needed. |

