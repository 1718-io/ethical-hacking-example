#!/bin/bash

# ---

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- >>> >>> [BUILD - ENV] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"

echo "# ----    NO VARS IN PROD ENV FOR NOW"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
export PATH=$PATH:/usr/local/go/bin
# gh pages : https://1718-io.github.io/ethical-hacking-example/
# export DEPLOYMENT_BASE_URL=https://1718-io.github.io/ethical-hacking-example/
export DEPLOYMENT_DOMAIN=${DEPLOYMENT_DOMAIN:-"1718-io.github.io"}
export DEPLOYMENT_BASE_URL=${DEPLOYMENT_BASE_URL:-"https://${DEPLOYMENT_DOMAIN}"}
export HUGO_BASE_URL=${HUGO_BASE_URL:-"${DEPLOYMENT_BASE_URL}"}
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
