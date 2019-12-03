#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TGTRELEASE=$1
if [[ $TGTRELEASE == "" ]]; then
  echo "Must pass a target release as first argument"
  echo "Example: dump_bz_id.sh 4.2.z"
  exit 1
fi

QUERY_URL_TEMPLATE="https://bugzilla.redhat.com/buglist.cgi?bug_status=NEW&bug_status=ASSIGNED&bug_status=POST&bug_status=MODIFIED&bug_status=ON_DEV&bug_status=ON_QA&bug_status=VERIFIED&bug_status=RELEASE_PENDING&classification=Red%20Hat&component=Migration%20Tooling&list_id=10686852&product=OpenShift%20Container%20Platform&query_format=advanced&target_release=%%TGTRELEASE%%"
RENDERED_URL=$(echo $QUERY_URL_TEMPLATE | sed "s|%%TGTRELEASE%%|$TGTRELEASE|")
curl --silent "$RENDERED_URL" | \
  grep show_bug | \
  perl -ne '/show_bug.*?>(\d*?)</ && print "$1\n"'
