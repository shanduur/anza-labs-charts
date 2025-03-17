# podvm

![Version: 0.0.0-alpha.4](https://img.shields.io/badge/Version-0.0.0--alpha.4-informational?style=flat) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat) ![AppVersion: 1.10.1](https://img.shields.io/badge/AppVersion-1.10.1-informational?style=flat)

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
| config.disk.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| config.disk.image.repository | string | `""` | Registry and repository for the podvm image. |
| config.disk.image.tag | string | `""` | Tag for the image. |
| config.kernel.image.bootArgs | string | `"ro console=ttyS0 noapic reboot=k panic=1 pci=off nomodules random.trust_cpu=on\nip=${FC_IP}::${TAP_IP}:${MASK_LONG}::eth0:off"` |  |
| config.kernel.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| config.kernel.image.repository | string | `""` | Registry and repository for the podvm image. |
| config.kernel.image.tag | string | `""` | Tag for the image. |
| config.machine.cpu | int | `2` | Number of VCPUs. Must be integer. |
| config.machine.mac | string | `"02:FC:00:00:00:05"` | VM network card MAC address. |
| config.machine.memory | int | `128` | Memory size in mebibytes. Must be integer. |
| firecracker.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| firecracker.image.repository | string | `"ghcr.io/anza-labs/library/firecracker"` | Registry and repository for the podvm image. |
| firecracker.image.tag | string | `"1.10.1"` | Tag for the image. |
| firecracker.securityContext | object | `{}` |  |
| fullnameOverride | string | `""` | Override for the full name. |
| imagePullSecrets | list | `[]` | Secrets for pulling images. |
| kvm.name | string | `"devices.anza-labs.dev/kvm"` | Name of the KVM device requested. Should be one of: `"devices.kubevirt.io/kvm"` when using https://github.com/kubevirt/kubernetes-device-plugins, `"devices.anza-labs.dev/kvm"` when using https://github.com/anza-labs/kubelet-device-plugins. |
| nameOverride | string | `""` | Override for the name. |
| nodeSelector | object | `{}` | Node selector for the pods. |
| podAnnotations | object | `{}` | Annotations to be added to the pods. |
| podLabels | object | `{}` | Labels to be added to the pods. |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas for the deployment. |
| sidecar.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| sidecar.image.repository | string | `"ghcr.io/anza-labs/library/iproute2"` | Registry and repository for the podvm image. |
| sidecar.image.tag | string | `"6.11.0-r0"` | Tag for the image. |
| tolerations | list | `[]` | Tolerations for the pods. |
| tun.name | string | `"devices.anza-labs.dev/tun"` | Name of the TUN device requested. `"devices.anza-labs.dev/tun"` when using https://github.com/anza-labs/kubelet-device-plugins. |

