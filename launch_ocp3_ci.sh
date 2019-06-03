#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$AWS_DEFAULT_REGION" == "" ]]; then
  echo 'Must have AWS_DEFAULT_REGION defined in environment'
  exit 1
fi

MIG_CI=/git/mig/mig-ci
export WORKSPACE=/git/mig/mig-ci-workspace
export EC2_REGION="$AWS_DEFAULT_REGION"
# Will default to 3.11, but can be set with this var
#export OPENSHIFT_VERSION='v3.11'

pushd $MIG_CI
ansible-playbook get_ocp3_oa.yml
ansible-playbook deploy_ocp3_cluster.yml
popd
