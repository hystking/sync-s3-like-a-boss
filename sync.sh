#!/bin/bash
set -e
SCRIPT_DIR=`dirname $0`

AWS_PROFILE=my-aws-profile
LOCAL_PATH=$SCRIPT_DIR/public/
S3_URI=s3://my-buket

SYNC_COMMAND="aws s3 sync $LOCAL_PATH $S3_URI --delete --cache-control no-cache --profile $AWS_PROFILE"

$SYNC_COMMAND --dryrun

read -p "Sync S3? [yes]: " yn
test "$yn" = "yes"

$SYNC_COMMAND
