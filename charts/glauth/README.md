# glauth

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat) ![AppVersion: v2.4.0](https://img.shields.io/badge/AppVersion-v2.4.0-informational?style=flat)

GLAuth is a secure, easy-to-use, LDAP server with configurable backends.

**Homepage:** <http://glauth.github.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| shanduur | <maturb@proton.me> | <http://linkedin.com/in/urbanekmateusz> |

## Source Code

* <https://github.com/glauth/glauth>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for the pods. |
| config.api | object | `{}` |  |
| config.backends[0].content | string | `""` | Inline content of the configuration file for the `file` backend in TOML format. This is usually a set of users, groups, and settings. If empty, no content is loaded. Example: content: |   [[users]]     name = "someuser"     password = "plaintext-or-hashed"     uidnumber = 5001     primarygroup = 5501    [[groups]]     name = "somegroup"     gidnumber = 5501 |
| config.backends[0].enabled | bool | `false` | Enable/disable default file backend. |
| config.backends[0].type | string | `"file"` | Backend for reading config from a file. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[1].enabled | bool | `false` | Enable/disable default S3 backend. |
| config.backends[1].type | string | `"s3"` | Backend for reading config from a S3 bucket. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[2].enabled | bool | `false` | Enable/disable default OwnCloud backend. |
| config.backends[2].type | string | `"owncloud"` | Backend for reading config from an OwnCloud. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[3].enabled | bool | `false` | Enable/disable default S3 backend. |
| config.backends[3].type | string | `"ldap"` | Backend for reading config from a ldap. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[4].enabled | bool | `false` | Enable/disable default MySQL backend. |
| config.backends[4].type | string | `"mysql"` | Backend for reading config from a MySQL/MariaDB database. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[5].enabled | bool | `false` | Enable/disable default PostgreSQL backend. |
| config.backends[5].type | string | `"postgresql"` | Backend for reading config from a PostgreSQL database. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.backends[6].backup.busyTimeout | string | `"1s"` | Busy timeout, if empty, default is used. |
| config.backends[6].backup.checkpointInterval | string | `"1m"` | Interval between checkpoints in Go duration format. If empty, default is used. |
| config.backends[6].backup.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| config.backends[6].backup.image.repository | string | `"docker.io/litestream/litestream"` | Registry and repository for the litestream image. |
| config.backends[6].backup.image.tag | string | `"0.3.13"` | Tag for the image. |
| config.backends[6].backup.logging.level | string | `"INFO"` | Logging level. Options: DEBUG, INFO, WARNING, ERROR |
| config.backends[6].backup.logging.stderr | bool | `false` | Whether to log to stderr (default is stdout) |
| config.backends[6].backup.logging.type | string | `"text"` | Logging format. Options: text or json |
| config.backends[6].backup.maxCheckpointPageCount | int | `10000` | Maximum number of pages processed during a checkpoint. |
| config.backends[6].backup.minCheckpointPageCount | int | `1000` | Minimum number of pages to trigger a checkpoint. |
| config.backends[6].backup.monitorInterval | string | `"1s"` | Interval for monitoring in Go duration format (e.g. "30s"). If empty, default is used. |
| config.backends[6].backup.resources | object | `{}` |  |
| config.backends[6].backup.secret.accessKey | string | `""` | Primary S3 access key. |
| config.backends[6].backup.secret.create | bool | `true` | Specifies whether a secret should be created. |
| config.backends[6].backup.secret.name | string | `""` | Specifies name of a secret used to configure the glauth. If not filled, uses full name. |
| config.backends[6].backup.secret.replicas | list | `[]` |  |
| config.backends[6].backup.secret.secretKey | string | `""` | Primary S3 secret key. |
| config.backends[6].backup.securityContext | object | `{}` |  |
| config.backends[6].enabled | bool | `true` | Enable/disable default SQLite backend. |
| config.backends[6].persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the PVC. |
| config.backends[6].persistence.annotations | object | `{}` | Annotations applied to PVC. |
| config.backends[6].persistence.enabled | bool | `false` | Enable/disable PVC creation for data. |
| config.backends[6].persistence.existingClaim | string | `""` | Use an existing PVC if defined, otherwise create one. |
| config.backends[6].persistence.size | string | `"10Gi"` | Storage size for the PVC. |
| config.backends[6].persistence.storageClass | string | `""` | Specify the StorageClass (if required). |
| config.backends[6].type | string | `"sqlite"` | Backend for reading config from an embedded SQLite database. Persistence and backup options are only supported for `type: sqlite`. Valid backend types: file, s3, owncloud, ldap, mysql, postgresql, sqlite |
| config.security | object | `{}` |  |
| fullnameOverride | string | `""` | Override for the full name. |
| glauth.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| glauth.image.repository | string | `"ghcr.io/glauth/glauth-plugins"` | Registry and repository for the glauth image. |
| glauth.image.tag | string | `"v2.4.0"` | Tag for the image. |
| glauth.resources | object | `{}` |  |
| glauth.securityContext | object | `{}` |  |
| imagePullSecrets | list | `[]` | Secrets for pulling images. |
| nameOverride | string | `""` | Override for the name. |
| nodeSelector | object | `{}` | Node selector for the pods. |
| podAnnotations | object | `{}` | Annotations to be added to the pods. |
| podLabels | object | `{}` | Labels to be added to the pods. |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas for the stateful set. |
| service.type | string | `"ClusterIP"` | Service type. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials. |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| tolerations | list | `[]` | Tolerations for the pods. |
| updateStrategy.rollingUpdate.maxUnavailable | string | `"100%"` |  |
| updateStrategy.rollingUpdate.partition | int | `0` |  |
| updateStrategy.type | string | `"RollingUpdate"` | The deployment strategy to use to replace existing pods with new ones. Options: "RollingUpdate" or "OnDelete". |

