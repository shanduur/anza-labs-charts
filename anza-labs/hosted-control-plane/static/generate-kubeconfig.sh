#!/usr/bin/env bash

set -eo pipefail

if [[ -z "${NEW_KUBECONFIG:-}" || -z "${CLUSTER_NAME:-}" || -z "${KUBERNETES_ENDPOINT:-}" || -z "${NAMESPACE:-}" ]]; then
  echo "Required environment variables: NEW_KUBECONFIG, CLUSTER_NAME, KUBERNETES_ENDPOINT, NAMESPACE"
  exit 1
fi

CA_CERT=/etc/pki/kubernetes/ca.crt
TLS_CERT=/etc/pki/kubernetes/tls.crt
TLS_KEY=/etc/pki/kubernetes/tls.key

if [[ ! -f "$CA_CERT" || ! -f "$TLS_CERT" || ! -f "$TLS_KEY" ]]; then
  echo "Missing required certificate files in /etc/pki/kubernetes/"
  exit 1
fi

kubectl config --kubeconfig="$NEW_KUBECONFIG" set-cluster "$CLUSTER_NAME" \
  --server="$KUBERNETES_ENDPOINT" \
  --certificate-authority="$CA_CERT" \
  --embed-certs=true

kubectl config --kubeconfig="$NEW_KUBECONFIG" set-credentials admin \
  --client-certificate="$TLS_CERT" \
  --client-key="$TLS_KEY" \
  --embed-certs=true

kubectl config --kubeconfig="$NEW_KUBECONFIG" set-context "$CLUSTER_NAME" \
  --cluster="$CLUSTER_NAME" \
  --user=admin

kubectl config --kubeconfig="$NEW_KUBECONFIG" use-context "$CLUSTER_NAME"

echo "Kubeconfig written to $NEW_KUBECONFIG"

kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: "${CLUSTER_NAME}${COMPONENT}-kubeconfig"
  namespace: "$NAMESPACE"
  labels:
    {{- include "hosted-control-plane.selectorLabels" . | nindent 8 }}
type: {{ .Values.generator.secretType }}
data:
  value: "$(base64 -w 0 "$NEW_KUBECONFIG")"
EOF
