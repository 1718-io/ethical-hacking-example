#!/bin/bash

# ---

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- >>> >>> [RELEASE - GITHUB PAGES] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"

# ----
#

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
export PATH=$PATH:/usr/local/go/bin
export RELEASE_VERSION=${RELEASE_VERSION:-"0.0.77"}
export DEPLOYMENT_DOMAIN=${DEPLOYMENT_DOMAIN:-"radiojaune.com"}
export DEPLOYMENT_BASE_URL=${DEPLOYMENT_BASE_URL:-"https://${DEPLOYMENT_DOMAIN}"}
export GH_PAGES_DEPLOYMENT_GIT_BRANCH=${GH_PAGES_DEPLOYMENT_GIT_BRANCH:-"monkey/tests-integration"}
export GH_PAGES_DEPLOYMENT_CNAME=${GH_PAGES_DEPLOYMENT_CNAME:-"1718-io.github.io/ethical-hacking-example"}
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ------ -  PATH=[${PATH}]"
echo "# ------ -  RELEASE_VERSION=[${RELEASE_VERSION}]"
echo "# ------ -  DEPLOYMENT_DOMAIN=[${DEPLOYMENT_DOMAIN}]"
echo "# ------ -  DEPLOYMENT_BASE_URL=[${DEPLOYMENT_BASE_URL}]"
echo "# ------ -  GH_PAGES_DEPLOYMENT_GIT_BRANCH=[${GH_PAGES_DEPLOYMENT_GIT_BRANCH}]"
echo "# ------ -  GH_PAGES_DEPLOYMENT_CNAME=[${GH_PAGES_DEPLOYMENT_CNAME}]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
go version || $(echo "You must install golang >= 1.16+"; exit 37;)
