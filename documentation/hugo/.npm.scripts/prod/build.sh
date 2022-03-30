#!/bin/bash

# ---


echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- >>> >>> [BUILD - PROD] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ------ ------ ------ ------ ------ ------ ------ #"
ls -alh  ./.npm.scripts/prod/env.sh
source ./.npm.scripts/prod/env.sh
echo "# ------ ------ ------ ------ ------ ------ ------ #"
echo "# ------ -  PATH=[${PATH}]"
echo "# ------ -  HUGO_BASE_URL=[${HUGO_BASE_URL}]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
# ----
#   1./ Will run the hugo prod build,
#   2./ then copy the content of the 'public/' folder, to the 'dist/' folder
# ---

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
# -- 1./ run the npm prod build,
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"
echo "# -- 1./ run the hugo prod build,"
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"


# cleaning public folder
if [ -d public/ ]; then
  rm -fr public/
fi;
mkdir public/

go version || $(echo "You must install golang >= 1.16+"; exit 37;)
hugo -b ${HUGO_BASE_URL}

echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"
echo "# -- 2./ copy content of the 'public/' folder, to the 'dist/' folder,"
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"


if [ -d dist/ ]; then
  rm -fr dist/
fi;
mkdir -p dist/


cp -fR ./public/* dist/
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
# -- 3./ then will generate the CNAME file into the dist folder
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #

echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"
echo "# -- 3./ then will generate the CNAME file into the dist folder"
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"

if [ -f ./CNAME ]; then
  rm -f ./CNAME
fi;
echo "${GH_PAGES_DEPLOYMENT_CNAME}" > dist/CNAME
echo "${GH_PAGES_DEPLOYMENT_CNAME}" > CNAME
