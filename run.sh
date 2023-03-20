#!/bin/sh

if [ -z "${KUBECONFIG}" ] && [ -z "${KUBE_CONFIG_DATA}" ]; then
  echo "No KUBECONFIG or KUBE_CONFIG_DATA provided"
  exit 1
fi


# Extract the base64 encoded config data and write this to the KUBECONFIG
if [ -n "${KUBECONFIG}" ]; then
  echo "$KUBECONFIG" | base64 -d > /tmp/config
fi

if [ -n "${KUBE_CONFIG_DATA}" ]; then
  echo "$KUBE_CONFIG_DATA" | base64 -d > /tmp/config
fi

export KUBECONFIG=/tmp/config

sh -c "$*"
