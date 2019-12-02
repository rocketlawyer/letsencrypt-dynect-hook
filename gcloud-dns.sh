#!/bin/bash

#$1 an operation name (clean_challenge, deploy_challenge, deploy_cert, invalid_challenge or request_failure) and some operands for that. For deploy_challenge
#
#$2 is the domain name for which the certificate is required,
#
#$3 is a "challenge token" (which is not needed for dns-01), and
#
#$4 is a token which needs to be inserted in a TXT record for the domain.

operation=$1
domain=$2
challenge_token=$3
token=$4

#dns_zone="eudev10.rocketldev.com"
dns_zone=$domain
managed_zone_name=$(echo ${dns_zone} | awk -F. '{print $1}')
record="_acme-challenge"
value=$token
#project="rl-gp-dev10"
project=$(echo "rl-gp-${managed_zone_name}" | sed 's/eu//')

gcloud dns record-sets transaction start --zone="${managed_zone_name}" --project ${project}
gcloud dns record-sets transaction add ${value} --name="${record}.${dns_zone}" \
  --ttl="30" \
  --type="TXT" \
  --zone="${dns_zone}" --project ${project}

gcloud dns record-sets transaction execute --zone="${managed_zone_name}" --project ${project}
