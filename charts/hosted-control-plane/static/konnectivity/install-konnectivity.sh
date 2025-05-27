#!/usr/bin/env bash

set -eo pipefail

if [[ -z "${TARGET_KUBECONFIG:-}" || -z "${MANIFESTS:-}" || -z "${API_SERVER:-}" || -z "${NAMESPACE:-}" || -z "${KONNECTIVITY_AGENT:-}" || -z "${VERBOSITY:-}" ]]; then
  echo "Required environment variables: TARGET_KUBECONFIG, MANIFESTS, API_SERVER, NAMESPACE, KONNECTIVITY_AGENT, VERBOSITY"
  exit 1
fi

MAX_RETRIES=5
BASE_DELAY=2

# Retry fetching LoadBalancer IP from the service
attempt=0
while (( attempt < MAX_RETRIES )); do
  PROXY_HOST=$(kubectl get svc "${API_SERVER}" -n "${NAMESPACE}" -o jsonpath='{.status.loadBalancer.ingress[0].ip}' || echo "")
  if [[ -n "${PROXY_HOST}" ]]; then
    echo "Retrieved LoadBalancer IP: ${PROXY_HOST}"
    break
  fi

  attempt=$((attempt + 1))
  sleep_time=$((BASE_DELAY ** attempt))
  echo "Retrying to fetch LoadBalancer IP in ${sleep_time}s (attempt ${attempt}/${MAX_RETRIES})..."
  sleep "${sleep_time}"
done

if [[ -z "${PROXY_HOST}" ]]; then
  echo "Failed to retrieve LoadBalancer IP for service ${API_SERVER} in namespace ${NAMESPACE} after ${MAX_RETRIES} attempts."
  exit 1
fi

export PROXY_HOST

attempt=0
while (( attempt < MAX_RETRIES )); do
  if envsubst < "${MANIFESTS}" | kubectl --kubeconfig="${TARGET_KUBECONFIG}" apply -f -; then
    echo "Apply succeeded"
    exit 0
  fi

  attempt=$((attempt + 1))
  sleep_time=$((BASE_DELAY ** attempt))

  echo "Retrying in ${sleep_time}s (attempt ${attempt}/${MAX_RETRIES})..."
  sleep "$sleep_time"
done

echo "Failed to apply manifests after ${MAX_RETRIES} attempts."
exit 1