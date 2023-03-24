#!/usr/bin/env bash

# https://hub.docker.com/_/vault/?tab=tags&page=1&ordering=last_updated
VAULT_IMAGE="hashicorp/vault:1.7.2"
GCP_PROJECT="vault-cloud-run-2020-05-04"
GCP_REGION="us.gcr.io"
GCP_IMAGE="$GCP_REGION/$GCP_PROJECT/$VAULT_IMAGE"

docker image pull $VAULT_IMAGE
docker image tag $VAULT_IMAGE $GCP_IMAGE
docker login -u _json_key -p $GOOGLE_CREDENTIALS https://$GCP_REGION
docker push $GCP_IMAGE

echo "$GCP_IMAGE"