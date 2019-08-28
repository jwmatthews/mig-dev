#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
migd=$_dir/..

oc get ns | grep nsk | awk '{print $1}' | xargs -I {} oc delete ns {}
$migd/setup_nfs.sh
$_dir/deploy_cluster_loader.sh
