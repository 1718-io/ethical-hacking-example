#!/bin/bash

# ---

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # -- >>> >>> [DEPLOY - DEV - to https://surge.sh] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"

# ----
#
export QUIJESUIS=$(whoami)
export CURRENT_GIT_COMMIT=$(git rev-parse HEAD)
export SURGE_DELOYMENT_DOMAIN=${SURGE_DELOYMENT_DOMAIN:-"live-${QUIJESUIS}-${CURRENT_GIT_COMMIT}-`1718-io`.surge.sh"}
export HEROKU_APP_ID=${HEROKU_APP_ID:-"xxxxxxxxxxxxxxxxxxx"}

echo "# --- # ---   SURGE_DELOYMENT_DOMAIN=[${SURGE_DELOYMENT_DOMAIN}]"
echo "# --- # ---   HEROKU_APP_ID=[${HEROKU_APP_ID}]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
export PATH=$PATH:/usr/local/go/bin
export RELEASE_VERSION=${RELEASE_VERSION:-"0.0.77"}
export DEPLOYMENT_DOMAIN=${DEPLOYMENT_DOMAIN:-"radiojaune.com"}
export DEPLOYMENT_BASE_URL=${DEPLOYMENT_BASE_URL:-"https://${DEPLOYMENT_DOMAIN}"}
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ------ -  PATH=[${PATH}]"
echo "# ------ -  RELEASE_VERSION=[${RELEASE_VERSION}]"
echo "# ------ -  DEPLOYMENT_DOMAIN=[${DEPLOYMENT_DOMAIN}]"
echo "# ------ -  DEPLOYMENT_BASE_URL=[${DEPLOYMENT_BASE_URL}]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
go version || $(echo "You must install golang >= 1.16+"; exit 37;)
