#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
migd=$_dir/..
o get ns | grep nsk | awk '{print $1}' | xargs -I {} oc delete ns {};
oc delete pv --al
