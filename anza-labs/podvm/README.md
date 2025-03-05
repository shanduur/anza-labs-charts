# podvm

![Version: 0.0.0-alpha.2](https://img.shields.io/badge/Version-0.0.0--alpha.2-informational?style=flat) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat) ![AppVersion: 1.10.1](https://img.shields.io/badge/AppVersion-1.10.1-informational?style=flat)

_podvm_ is a PoC/testing ground for any improvements that might
reach Cluster API Infrastructure Provider KinK manifests.

**Homepage:** <https://anza-labs.github.io/kink>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Mateusz Urbanek | <matueusz.urbanek.98@gmail.com> | <http://linkedin.com/in/urbanekmateusz> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{"nodeAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"kubernetes.io/arch","operator":"In","values":["amd64","arm64"]},{"key":"kubernetes.io/os","operator":"In","values":["linux"]}]}]}}}` | Affinity settings for the pods. |
| config.machine.cpu | int | `2` | Number of VCPUs. Must be integer. |
| config.machine.memory | int | `1024` | Memory size in mebibytes. Must be integer. |
| fullnameOverride | string | `""` | Override for the full name. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| image.repository | string | `"ghcr.io/anza-labs/library/firecracker"` | Registry and repository for the podvm image. |
| image.tag | string | `"1.10.1"` | Tag for the image. |
| imagePullSecrets | list | `[]` | Secrets for pulling images. |
| kvm.name | string | `"devices.anza-labs.com/kvm"` | Name of the KVM device requested. Should be one of: `"devices.kubevirt.io/kvm"` when using https://github.com/kubevirt/kubernetes-device-plugins, `"devices.anza-labs.com/kvm"` when using https://github.com/anza-labs/kvm-device-plugin. |
| nameOverride | string | `""` | Override for the name. |
| nodeSelector | object | `{}` | Node selector for the pods. |
| podAnnotations | object | `{}` | Annotations to be added to the pods. |
| podLabels | object | `{}` | Labels to be added to the pods. |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas for the deployment. |
| securityContext | object | `{}` |  |
| tap.name | string | `"devices.anza-labs.com/tap"` | Name of the TAP device requested. |
| tolerations | list | `[]` | Tolerations for the pods. |

