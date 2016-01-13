#!/bin/bash
set -e

SCRIPT_DIR=`dirname $0`
TIMESTAMP=`date +%s`

#-----------------+
#     CONFIGS     |
#-----------------+

# aws-cli profile
AWS_PROFILE=my-aws-profile

# CloudFront Distribution ID
CLOUDFRONT_DISTRIBUTION_ID=MY_CLOUDFRONT_DISTRIBUTION_ID

# template to use new invalidation.json
INVALIDATION_TEMPLATE_JSON=$SCRIPT_DIR/templates/invalidation.json

# temporary file path
INVALIDATION_JSON=$SCRIPT_DIR/invalidation-temp.json

# editor command to edit  invalidation.json
EDITOR=vim

#-----------------+
#    PROCEDURE    |
#-----------------+

CREATE_INVALIDATION_COMMAND="aws cloudfront create-invalidation --profile $AWS_PROFILE"

sed -e "s/DISTRIBUTION_ID/$CLOUDFRONT_DISTRIBUTION_ID/" -e "s/CALLER_REFERENCE/$TIMESTAMP/" $INVALIDATION_TEMPLATE_JSON > $INVALIDATION_JSON
$EDITOR $INVALIDATION_JSON

read -p "Invalidate CloudFront? [yes]: " yn
test "$yn" = "yes"

$CREATE_INVALIDATION_COMMAND --cli-input-json file://$INVALIDATION_JSON
