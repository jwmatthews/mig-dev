#!/bin/bash
# NOTE: Will clean a target cluster, usually the ocp4 cluster.
# Optionally you could remove the line that deletes the mig plans if you
# just want to reuse the same plan (you should be able to do that).

# Kill the migrated app
oc delete project mysql-persistent

# Clean the PV that was claimed
DELETEPV=$(o get pv | grep mysql-persistent | awk '{ print $1 }')
oc delete pv $DELETEPV

# Clean migrations
oc delete mig migmigrations --all

# Optionally kill any of the plans
oc delete -n mig migplans --all
