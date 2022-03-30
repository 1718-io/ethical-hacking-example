#!/bin/bash
export radiojaune_ENV=${radiojaune_ENV:-"staging"}
source .${radiojaune_ENV}.env
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:radio-jaune/hugo-theme-grayscale.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:runningstream/hugograyscale.git"}
export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:halogenica/beautifulhugo.git"}

# export HUGO_THEME_VERSION="1.1.0"
# export HUGO_THEME_VERSION="2.9.2"
# export HUGO_THEME_VERSION="2.5.0"
export HUGO_THEME_VERSION=${HUGO_THEME_VERSION:-"master"}


if [ "x${HUGO_BASE_URL}" == "x" ]; then
  export HUGO_BASE_URL=${HUGO_BASE_URL:-"http://127.0.0.1:5445"}
  echo "the HUGO_BASE_URL env. var. is not defined, defaulting to HUGO_BASE_URL=[${HUGO_BASE_URL}]"
fi;

# if [ "x${HUGO_BASE_URL}" == "x" ]; then
  # echo "the HUGO_BASE_URL env. var. is not defined, stopping the hugo project spawn"
  # echo "set the HUGO_BASE_URL env. var.n, and re-run npm run spawn"
  # exit 7
# fi;


# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- 1./ GIT CLONE THE HUGO THEME INTO A TEMP FOLDER (not the project folder)
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #

export TEMP_SPAWN_HOME=$(mktemp -d -t "TEMP_SPAWN_HOME-XXXXXXXXXX")
echo "TEMP_SPAWN_HOME is now : [${TEMP_SPAWN_HOME}]"
git clone ${HUGO_THEME_GIT_SSH} ${TEMP_SPAWN_HOME}
export WHERE_AMI=$(pwd)
cd ${TEMP_SPAWN_HOME}
git checkout ${HUGO_THEME_VERSION}




# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- 2./ RETRIEVE IN PROJECT, ALL FILES FROM EXAMPLE SITE IN HUGO THEME
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #

cd ${WHERE_AMI}
# rm -fr ${WHERE_AMI}/.git/
mkdir content/
mkdir data/
mkdir static/
mkdir assets/
mkdir layouts/
mkdir resources/


# cp -rT ${TEMP_SPAWN_HOME}/content ./content
cp -fR ${TEMP_SPAWN_HOME}/content/* ./content/

# cp -rT ${TEMP_SPAWN_HOME}/data ./data
cp -fR ${TEMP_SPAWN_HOME}/data/* ./data/

# cp -rT ${TEMP_SPAWN_HOME}/static ./static
cp -fR ${TEMP_SPAWN_HOME}/static/* ./static/

# cp -rT ${TEMP_SPAWN_HOME}/assets ./assets
cp -fR ${TEMP_SPAWN_HOME}/assets/* ./assets/

# cp -rT ${TEMP_SPAWN_HOME}/layouts ./layouts
cp -fR ${TEMP_SPAWN_HOME}/layouts/* ./layouts/

# cp -rT ${TEMP_SPAWN_HOME}/resources ./resources
cp -fR ${TEMP_SPAWN_HOME}/resources/* ./resources/


if [ -d ${TEMP_SPAWN_HOME}/exampleSite ]; then
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.toml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.yaml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.yml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.json .
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/content/* ./content/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/data ./data
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/data/* ./data/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/static ./static
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/static/* ./static/
  cp ${TEMP_SPAWN_HOME}/exampleSite/assets/custom-theme.scss ./assets
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/content/* ./content/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/assets ./assets
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/assets/* ./assets/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/layouts ./layouts
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/layouts/* ./layouts/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/resources ./resources
  cp -fR ${TEMP_SPAWN_HOME}/exampleSite/resources/* ./resources/
fi;



if [ -d ${TEMP_SPAWN_HOME}/website ]; then
  cp ${TEMP_SPAWN_HOME}/website/config.toml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.yaml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.yml .
  cp ${TEMP_SPAWN_HOME}/exampleSite/config.json .
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPAWN_HOME}/website/content/* ./content/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/data ./data
  cp -fR ${TEMP_SPAWN_HOME}/website/data/* ./data/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/static ./static
  cp -fR ${TEMP_SPAWN_HOME}/website/static/* ./static/
  cp ${TEMP_SPAWN_HOME}/website/assets/custom-theme.scss ./assets
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPAWN_HOME}/website/content/* ./content/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/assets ./assets
  cp -fR ${TEMP_SPAWN_HOME}/website/assets/* ./assets/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/layouts ./layouts
  cp -fR ${TEMP_SPAWN_HOME}/website/layouts/* ./layouts/
  # cp -rT ${TEMP_SPAWN_HOME}/exampleSite/resources ./resources
  cp -fR ${TEMP_SPAWN_HOME}/website/resources/* ./resources/
fi;
















# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- 3./ RESOLVE HUGO THEME NAME FROM [theme.toml]
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #


resolveHugoThemeName () {

  export HUGO_THEME_TOML_CONFIG_PATH=${TEMP_SPAWN_HOME}/theme.toml
  echo "[resolveHugoThemeName ()] - TEMP_SPAWN_HOME is now : [${TEMP_SPAWN_HOME}]"
  echo "[resolveHugoThemeName ()] - HUGO_THEME_TOML_CONFIG_PATH is : [${HUGO_THEME_TOML_CONFIG_PATH}]"
  npm run parse-hugo-theme-toml | tee -a ${TEMP_SPAWN_HOME}/hugo.theme.to.json

  # cat ${TEMP_SPAWN_HOME}/hugo.theme.to.json | jq .name
  # cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}'
  cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]' | sed 's# #-#g'

  # export HUGO_THEME_NAME=$(cat ${TEMP_SPAWN_HOME}/hugo.theme.to.json | jq .name)
  export HUGO_THEME_NAME=$(cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]' | sed 's# #-#g')

  echo "# ----------- "
  echo "# ----------- According [theme.toml], the hugo theme name is : [${HUGO_THEME_NAME}]"
  echo "# ----------- "
}



resolveHugoThemeName











# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- 3./ GENERATE HUGO PROJECT MAIN CONFIGURATION FILE
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #




cd ${WHERE_AMI}/


if [ -f ${WHERE_AMI}/config.toml ]; then
  export NO_TOML="false"
else
  export NO_TOML="true"
fi;


if [ -f ${WHERE_AMI}/config.yaml ]; then
  export NO_YAML="false"
else
  export NO_YAML="true"
fi;

if [ -f ${WHERE_AMI}/config.yml ]; then
  export NO_YML="false"
else
  export NO_YML="true"
fi;

if [ -f ${WHERE_AMI}/config.json ]; then
  export NO_JSON="false"
else
  export NO_JSON="true"
fi;


if [[ "x${NO_TOML}" == "xtrue" && "x${NO_YAML}" == "xtrue" && "x${NO_YML}" == "xtrue" && "x${NO_JSON}" == "xtrue" ]]; then
# if [ "x${NO_TOML}" == "xtrue"] && [ "x${NO_YAML}" == "xtrue"] && [ "x${NO_YML}" == "xtrue"] && [ "x${NO_JSON}" == "xtrue" ]; then
  echo "[$0] - Error: Could not find any Hugo configuration file in example Site folder of Hugo Theme, in the [] Folder"
  echo "   NO_TOML=[${NO_TOML}]"
  echo "   NO_YAML=[${NO_YAML}]"
  echo "   NO_YML=[${NO_YML}]"
  echo "   NO_JSON=[${NO_JSON}]"

  exit 1972
else
  echo "# ------------ ------------ ------------ ------------ ------------ ------------ ------------ #"
  echo "# ------------ ------------ ------------ ------------ ------------ ------------ ------------ #"
  echo "# ------------ ------------ ------------ ------------ ------------ ------------ ------------ #"
fi;

export HUGO_CONFIG_OPTS="+${NO_TOML}+${NO_YAML}+${NO_YML}+${NO_JSON}"


echo "# ------------ ------------ ------------ ------------ ------------ ------------ ------------ #"
echo "# ------------ -------    HUGO_CONFIG_OPTS=[${HUGO_CONFIG_OPTS}] #"
echo "# ------------ ------------ ------------ ------------ ------------ ------------ ------------ #"




# case HUGO_CONFIG_OPTS in
#
#   "+false+true+true+true")
#   echo "The hugo project uses [./config.toml] as configuration file";
#   ;;
#
#   '+true+false+true+true')
#   echo "The hugo project uses [./config.yaml] as configuration file";
#   ;;
#
#   "+true+true+false+true")
#   echo "The hugo project uses [./config.yml] as configuration file";
#   ;;
#
#   "+true+true+true+false")
#   echo "The hugo project uses [./config.json] as configuration file";
#   ;;
#
#   *)
#   echo "Could not determine which configuration file the Hugo project uses, based on HUGO_CONFIG_OPTS=[${HUGO_CONFIG_OPTS}] "
#   ;;
# esac






if [ "${HUGO_CONFIG_OPTS}" == "+false+true+true+true" ]; then
  echo "The hugo project uses [./config.toml] as configuration file";
else
  if [ "${HUGO_CONFIG_OPTS}" == '+true+false+true+true' ]; then
    echo "The hugo project uses [./config.yaml] as configuration file";
  else
    if [ "${HUGO_CONFIG_OPTS}" == "+true+true+false+true" ]; then
      echo "The hugo project uses [./config.yml] as configuration file";
    else
      if [ "${HUGO_CONFIG_OPTS}" == "+true+true+true+false" ]; then
        echo "The hugo project uses [./config.json] as configuration file";
      else
        echo "Could not determine which configuration file the Hugo project uses, based on HUGO_CONFIG_OPTS=[${HUGO_CONFIG_OPTS}] "
      fi;
    fi;
  fi;
fi;






cd ${WHERE_AMI}/




# exit 0









processTomlConfig () {

sed -i "s#baseURL =.*#baseURL = \"${HUGO_BASE_URL}\"#g" ./config.toml
sed -i "s#theme =.*#theme = \"${HUGO_THEME_NAME}\"#g" ./config.toml


cat <<EOF > ./addon.config.toml
# --- # ---  # ---
# --- # ---  # ---
# Pokus.io Addon
# --- # ---  # ---
#
[${HUGO_THEME_NAME}.custom_theme_options]
targetPath = "assets/custom-theme.css"
enableSourceMap = true

# --- # ---  # ---
# Addon to use Bulma as integrated SCSS Processor
[[module.imports]]
  path = "github.com/jgthms/bulma"
  disable = false
  # [[module.imports.mounts]]
    # source = "."
    # target = "assets/sass"
  [[module.imports.mounts]]
    source = "."
    target = "assets/bulma"
EOF

echo '' | tee -a ./config.toml
echo '' | tee -a ./config.toml
cat ./addon.config.toml | tee -a ./config.toml
rm ./addon.config.toml


echo "# ----------- AVANT SED [./config.toml]"
echo "DEBUG : ./config.toml"
ls -alh ./config.toml
echo "DEBUG : ./config.toml | grep themesdir"
cat ./config.toml | grep themesdir
sed -i "s#themesDir.*=.*#themesDir = \"./themes\"#g" ./config.toml
sed -i "s#themesdir.*=.*#themesdir = \"./themes\"#g" ./config.toml
echo "# ----------- APRÈS SED [./config.toml]"
echo "DEBUG : ./config.toml"
ls -alh ./config.toml
echo "DEBUG : ./config.toml | grep themesdir"
cat ./config.toml | grep themesdir

}


























processYamlConfig () {

export EXAMPLE_YAML_CONFIG=$1

if [ "x${EXAMPLE_YAML_CONFIG}" == "x" ]; then
  echo "[processYamlConfig ()] - Error: You did not provide any argument when invoking [processYamlConfig ()]"
  exit 64
  if ! [ -f ${EXAMPLE_YAML_CONFIG}]; then
    echo "[processYamlConfig ()] - Error: The EXAMPLE_YAML_CONFIG=[${EXAMPLE_YAML_CONFIG}] File does not exist"
    exit 68
  fi;
fi;

if [ -f ./config.yml ]; then
  rm -f ./config.yml
fi;

cp ${EXAMPLE_YAML_CONFIG} ./config.yml || $(echo "An error occured while executing the [cp ${EXAMPLE_YAML_CONFIG} ./config.yml] command" && exit 56)

# ---> File must exists
# export HUGO_PRJ_YAML_CONFIG_PATH=${HUGO_PRJ_YAML_CONFIG_PATH:-'./spawn_config.yml.dummy.path.yml'}



export HUGO_PRJ_YAML_CONFIG_PATH=${HUGO_PRJ_YAML_CONFIG_PATH:-'./config.yml'}

export HUGO_BASE_URL=${HUGO_BASE_URL:-"http://127.0.0.7:65534"}
export HUGO_THEME_NAME=${HUGO_THEME_NAME:-'spawn_pokus_dummy_hugo_theme_name'}
echo "[processYamlConfig ()] ------------------------------------------------"
echo "[processYamlConfig ()] - EXAMPLE_YAML_CONFIG=[${EXAMPLE_YAML_CONFIG}]"
echo "[processYamlConfig ()] - HUGO_PRJ_YAML_CONFIG_PATH=[${HUGO_PRJ_YAML_CONFIG_PATH}]"
echo "[processYamlConfig ()] - HUGO_BASE_URL=[${HUGO_BASE_URL}]"
echo "[processYamlConfig ()] - HUGO_THEME_NAME=[${HUGO_THEME_NAME}]"
echo "[processYamlConfig ()] ------------------------------------------------"


npm run spawn:project:gen:hugo-prj-config-yaml

}




























processJSonConfig () {

echo " [------------------------------------------------]"
echo " [processJSonConfig ()]  Not Impelmented Exception"
echo " [------------------------------------------------]"
exit  67

export EXAMPLE_JSON_CONFIG=$1

if [ "x${EXAMPLE_JSON_CONFIG}" == "x" ]; then
  echo "[processJSonConfig ()] - Error: You did not provide any argument when invoking [processJSonConfig ()]"
  exit 64
  if ! [ -f ${EXAMPLE_JSON_CONFIG}]; then
    echo "[processJSonConfig ()] - Error: The EXAMPLE_JSON_CONFIG=[${EXAMPLE_JSON_CONFIG}] File does not exist"
    exit 68
  fi;
fi;

if [ -f ./config.json ]; then
  rm -f ./config.json
fi;

cp ${EXAMPLE_JSON_CONFIG} ./config.json || $(echo "An error occured while executing the [cp ${EXAMPLE_JSON_CONFIG} ./config.json] command" && exit 56)

# ---> File must exists
# export HUGO_PRJ_JSON_CONFIG_PATH=${HUGO_PRJ_JSON_CONFIG_PATH:-'./spawn_config.yml.dummy.path.yml'}



export HUGO_PRJ_JSON_CONFIG_PATH=${HUGO_PRJ_JSON_CONFIG_PATH:-'./config.json'}

export HUGO_BASE_URL=${HUGO_BASE_URL:-"http://127.0.0.7:65534"}
export HUGO_THEME_NAME=${HUGO_THEME_NAME:-'spawn_pokus_dummy_hugo_theme_name'}
echo "[processJSonConfig ()] ------------------------------------------------"
echo "[processJSonConfig ()] - EXAMPLE_JSON_CONFIG=[${EXAMPLE_JSON_CONFIG}]"
echo "[processJSonConfig ()] - HUGO_PRJ_JSON_CONFIG_PATH=[${HUGO_PRJ_JSON_CONFIG_PATH}]"
echo "[processJSonConfig ()] - HUGO_BASE_URL=[${HUGO_BASE_URL}]"
echo "[processJSonConfig ()] - HUGO_THEME_NAME=[${HUGO_THEME_NAME}]"
echo "[processJSonConfig ()] ------------------------------------------------"


npm run spawn:project:gen:hugo-prj-config-json


}












prepareTestsProcessJSonConfig () {
export TEST_JSON_CONFIG='./.npm.scripts/test/data/config.test.json'
cp ${TEST_JSON_CONFIG} ./config.json || $(echo "An error occured while executing the [cp ${TEST_JSON_CONFIG} ./config.json] command" && exit 56)
}







cd ${WHERE_AMI}/

if [ "${HUGO_CONFIG_OPTS}" == "+false+true+true+true" ]; then
  echo "The hugo project uses [./config.toml] as configuration file";
  processTomlConfig
else
  if [ "${HUGO_CONFIG_OPTS}" == '+true+false+true+true' ]; then
    echo "The hugo project uses [./config.yaml] as configuration file";
    processYamlConfig ${WHERE_AMI}/config.yaml
  else
    if [ "${HUGO_CONFIG_OPTS}" == "+true+true+false+true" ]; then
      echo "The hugo project uses [./config.yml] as configuration file";
      processYamlConfig ${WHERE_AMI}/config.yml
    else
      if [ "${HUGO_CONFIG_OPTS}" == "+true+true+true+false" ]; then
        echo "The hugo project uses [./config.json] as configuration file";
        processJSonConfig
      else
        echo "Could not determine which configuration file the Hugo project uses, based on HUGO_CONFIG_OPTS=[${HUGO_CONFIG_OPTS}] "
      fi;
    fi;
  fi;
fi;



# case HUGO_CONFIG_OPTS in
#
#   "+false+true+true+true")
#     echo "The hugo project uses [./config.toml] as configuration file";
#     processTomlConfig
#     ;;
#
#   "+true+false+true+true")
#     echo "The hugo project uses [./config.yaml] as configuration file";
#     processYamlConfig ${WHERE_AMI}/config.yaml
#     ;;
#
#   "+true+true+false+true")
#     echo "The hugo project uses [./config.yml] as configuration file";
#     processYamlConfig ${WHERE_AMI}/config.yml
#     ;;
#
#   "+true+true+true+false")
#     echo "The hugo project uses [./config.json] as configuration file";
#     processJSonConfig
#     ;;
#
#   *)
#     echo "Could not determine which configuration file the Hugo project uses, based on HUGO_CONFIG_OPTS=[${HUGO_CONFIG_OPTS}] "
#     ;;
# esac


cd ${WHERE_AMI}/


# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- 4./ INSTALL HUGO THEME INSIDE THE HUGO PROJECT
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #



mkdir -p themes/${HUGO_THEME_NAME}
cp -rT ${TEMP_SPAWN_HOME} ./themes/${HUGO_THEME_NAME}


# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# That's for Hugo Themes which have a nodejs / npm package project structure
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# if [ [ -f ./themes/${HUGO_THEME_NAME}/package.json ] || [ -f ./package.json ] ]; then
# if [ -f ./themes/${HUGO_THEME_NAME}/package.json ] || [ -f ./package.json ]; then
if [ -f ./themes/${HUGO_THEME_NAME}/package.json ]; then
  cd ./themes/${HUGO_THEME_NAME}
  echo "The [$(pwd)//themes/${HUGO_THEME_NAME}] Hugo Theme contains a [package.json]"
  # sudo npm i -g node-sass || true
  npm i
  # npm run build || true
  # npm build || true
  # npm start
  cd  ../..
fi;


# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #
# For all Hugo Themes I installl bulma into the the ["assets/"] Hugo prohject
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- #

# sudo npm i -g sass
npm i -g sass

export BULMA_VERSION=0.9.3
npm i bulma@${BULMA_VERSION}
if [ -d assets/bulma/ ]; then
  echo "# --- # ---"
  rm -fr assets/bulma/
  mkdir -p  assets/bulma/
fi;
cp -fR ./node_modules/bulma/* ./assets/bulma/
npm remove bulma@${BULMA_VERSION}

rm -fr ./themes/${HUGO_THEME_NAME}/.git/

export PATH=$PATH:/usr/local/go/bin && go version

echo "# ----------- AVANT MINIFY"
# hugo --gc --minify
# hugo --gc --minify --buildFuture
echo "# ----------- APRÈS MINIFY"

hugo
# export PATH=$PATH:/usr/local/go/bin && go version && hugo serve -bttp://127.0.0.1:1313
