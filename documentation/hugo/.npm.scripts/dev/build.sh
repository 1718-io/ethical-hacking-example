#!/bin/bash

# ---

echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- >>> >>> [BUILD - DEV] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ------ ------ ------ ------ ------ ------ ------ #"
ls -alh ./.npm.scripts/dev/env.sh
source ./.npm.scripts/dev/env.sh
echo "# ------ ------ ------ ------ ------ ------ ------ #"
echo "# ------ -  PATH=[${PATH}]"
echo "# ------ -  HUGO_HOST=[${HUGO_HOST}]"
echo "# ------ -  HUGO_PORT=[${HUGO_PORT}]"
echo "# ------ -  HUGO_BASE_URL=[${HUGO_BASE_URL}]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ----    NO OPERATIONS IN DEV BUILD FOR NOW"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
# ----
#   1./ Will run the hugo dev build,
#   2./ then copy content of the 'public/' to the 'dist/' folder
# ---

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
# -- 1./ run the npm dev build,
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"
echo "# -- 1./ run the npm dev build : the hugo build"
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"


# export PATH=$PATH:/usr/local/go/bin
# export HUGO_HOST=${HUGO_HOST:-"127.0.0.1"}
# export HUGO_PORT=${HUGO_PORT:-"4547"}
# export HUGO_BASE_URL="http://127.0.0.1:5445"
# export HUGO_BASE_URL=${HUGO_BASE_URL:-"http://${HUGO_HOST}:${HUGO_PORT}"}

# export PATH=$PATH:/usr/local/go/bin && go version || $(echo "You must install golang >= 1.16+"; exit 37;)
go version || $(echo "You must install golang >= 1.16+"; exit 37;)

# cleaning public folder
if [ -d public/ ]; then
  rm -fr public/
fi;
mkdir public/

hugo -b ${HUGO_BASE_URL}



# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
# -- 2./ then copy to 'dist/', and finally will
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"
echo "# -- 2./ then copy to 'dist/', and finally will"
echo "# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #"

if [ -d dist/ ]; then
  rm -fr dist/
fi;
mkdir -p dist/

cp ./*.html dist/
cp ./*.css dist/
cp ./config.json dist/
cp ./affiche-*.jpg dist/
cp ./favicon.ico dist/

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
