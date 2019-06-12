#!/bin/bash
oc delete project mysql-persistent && oc delete pv pv9 && oc delete -n mig migmigrations --all && oc delete -n mig migplans --all
