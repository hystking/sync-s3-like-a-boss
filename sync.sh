#!/bin/bash
set -e
SCRIPT_DIR=`dirname $0`

#-----------------+
#     CONFIGS     |
#-----------------+

# aws-cli profile
AWS_PROFILE=my-aws-profile

# root path to sync
LOCAL_PATH=$SCRIPT_DIR/public/

# S3 bucket URI
S3_URI=s3://my-buket

#-----------------+
#    PROCEDURE    |
#-----------------+

SYNC_COMMAND="aws s3 sync $LOCAL_PATH $S3_URI --delete --cache-control no-cache --profile $AWS_PROFILE"

$SYNC_COMMAND --dryrun

read -p "Sync S3? [yes]: " yn
test "$yn" = "yes"

$SYNC_COMMAND
