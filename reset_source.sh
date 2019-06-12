#!/bin/bash
# NOTE: Reset "replicas" from 0 to 1, save and quit to bring app back up
oc edit -n mysql-persistent dc/mysql
