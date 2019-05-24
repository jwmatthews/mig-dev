#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$AWS_DEFAULT_REGION" == "" ]]; then
  echo 'Must have AWS_DEFAULT_REGION defined in environment'
  exit 1
fi

MIG_CI=/git/mig/mig-ci
export WORKSPACE=/git/mig/mig-ci-workspace
export EC2_REGION="$AWS_DEFAULT_REGION"
export EC2_KEY='libra'
# Will default to 3.11, but can be set with this var
#export OPENSHIFT_VERSION='v3.11'

pushd $MIG_CI
#ansible-playbook nfs_server_deploy.yml
ansible-playbook nfs_provision_pvs.yml
popd
