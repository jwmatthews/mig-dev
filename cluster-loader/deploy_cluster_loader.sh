#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KUBECONFIG=${KUBECONFIG:-~/.kube/config}
TESTS_IMG_TAG=latest
#TESTS_IMG_TAG="4.1"

podman run \
  -v ${KUBECONFIG}:/root/.kube/config \
  -v ${_dir}:/tmp/cluster-loader \
  -i "quay.io/openshift/origin-tests:${TESTS_IMG_TAG}" \
  /bin/bash -c 'export KUBECONFIG=/root/.kube/config && VIPERCONFIG=/tmp/cluster-loader/nsk-test.yaml openshift-tests run-test "[Feature:Performance][Serial][Slow] Load cluster concurrently with templates [Suite:openshift]"'
