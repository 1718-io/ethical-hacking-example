#!/bin/bash

# ---
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- >>> >>> [START - DEV] <<< <<< "
echo "# --- # ---  [$0]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# ------ ------ ------ ------ ------ ------ ------ #"
ls -alh ./.npm.scripts/dev/env.sh
source ./.npm.scripts/dev/env.sh
echo "# ------ ------ ------ ------ ------ ------ ------ #"
echo "# ------ -  PATH=[${PATH}]"
echo "# ------ -  HUGO_HOST=[${HUGO_HOST}]"
echo "# ------ -  HUGO_PORT=[${HUGO_PORT}]"
echo "# ------ -  HUGO_BASE_URL=[${HUGO_BASE_URL}]"
echo "# ------ -  START COMMAND = [hugo serve -b ${HUGO_BASE_URL} -p ${HUGO_PORT} --bind ${HUGO_HOST} -w]"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #"
# export PATH=$PATH:/usr/local/go/bin
# export HUGO_HOST=${HUGO_HOST:-"127.0.0.1"}
# export HUGO_PORT=${HUGO_PORT:-"4547"}
# # export HUGO_BASE_URL="http://127.0.0.1:5445"
# export HUGO_BASE_URL=${HUGO_BASE_URL:-"http://${HUGO_HOST}:${HUGO_PORT}"}
# export PATH=$PATH:/usr/local/go/bin && go version || $(echo "You must install golang >= 1.16+"; exit 37;)
go version || $(echo "You must install golang >= 1.16+"; exit 37;)
hugo serve -b ${HUGO_BASE_URL} -p ${HUGO_PORT} --bind ${HUGO_HOST} -w
