# kube-storage-version-migrator

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat) ![AppVersion: v0.0.5](https://img.shields.io/badge/AppVersion-v0.0.5-informational?style=flat)

This tool migrates stored data in etcd to the latest storage version.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Mateusz Urbanek | <matueusz.urbanek.98@gmail.com> | <http://linkedin.com/in/urbanekmateusz> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for the pods. |
| fullnameOverride | string | `""` | Override for the full name. |
| imagePullSecrets | list | `[]` | Secrets for pulling images. |
| migrator.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| migrator.image.repository | string | `"registry.k8s.io/storage-migrator/storage-version-migration-migrator"` | Registry and repository for the scribe image. |
| migrator.image.tag | string | `"v0.0.5"` | Tag for the image. |
| migrator.replicaCount | int | `1` | Number of replicas for the deployment. |
| nameOverride | string | `""` | Override for the name. |
| nodeSelector | object | `{}` | Node selector for the pods. |
| podAnnotations | object | `{}` | Annotations to be added to the pods. |
| podLabels | object | `{}` | Labels to be added to the pods. |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| tolerations | list | `[]` | Tolerations for the pods. |
| trigger.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| trigger.image.repository | string | `"registry.k8s.io/storage-migrator/storage-version-migration-trigger"` | Registry and repository for the scribe image. |
| trigger.image.tag | string | `"v0.0.5"` | Tag for the image. |
| trigger.replicaCount | int | `1` | Number of replicas for the deployment. |

