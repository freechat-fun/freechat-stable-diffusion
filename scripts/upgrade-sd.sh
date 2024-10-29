#!/usr/bin/env bash

source $(dirname ${BASH_SOURCE[0]})/setenv.sh

check_helm

# helm repo update
helm upgrade --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} -f ${values_yaml} \
  --set deployment.enabled=true \
  --set persistence.enabled=false \
  ${ARGS[*]} \
  ${PROJECT_NAME} ${HELM_CONFIG_HOME}
