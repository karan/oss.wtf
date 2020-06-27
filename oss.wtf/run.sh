#!/bin/sh
# Run as ./run.sh $GCP_PROJECT_NAME

GOOGLE_CLOUD_KEYFILE_JSON=$(cat account.json)
GCP_PROJECT=$1

terraform init -input=false

terraform plan -var="project_name=$GCP_PROJECT" -input=false -no-color

terraform apply -auto-approve -var="project_name=$GCP_PROJECT"
