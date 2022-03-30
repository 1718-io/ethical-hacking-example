# The 1718 Ethical Hacking Example

This repository version controls the source of the one pager website served at :

* https://1718-io.github.io/ethical-hacking-example

This is the main publishing media for a work called "_Ethical Hacking Example_" :
* On this page, people can read and learn about vulnerabilities discovered on https://controlecitoyenelection.com .  with ehtical hacking principles.
* those people can be everyday citizenb interested in learning about today's tehcnologies social and pilitical challenges.
* Other readers maybe professionals working in the same Industry as I do, that IT cloud industry / devops.

## Howtos


### Locally run

```bash
# --
export DEPLOYMENT_BASE_URL=https://1718-io.github.io/ethical-hacking-example/


npm run preps

npm start
```

### Deploy to github pages

```bash
# --
export DEPLOYMENT_BASE_URL=https://1718-io.github.io/ethical-hacking-example/

```


### Re-generate this project from a different Hugo Theme

Find any theme you want here :

* https://github.com/search?q=hugo+theme
* https://themes.gohugo.io/

And run :

```bash
# --
export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:halogenica/beautifulhugo.git"}
export HUGO_THEME_VERSION=${HUGO_THEME_VERSION:-"master"}

npm run preps

npm run spawn:project:clean
npm run spawn:project:gen

npm start

# Ctrl + C

export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:StefMa/hugo-fresh.git"}
export HUGO_THEME_VERSION=${HUGO_THEME_VERSION:-"master"}


npm run spawn:project:clean
npm run spawn:project:gen

npm start



```


### Misc

#### Run integration tests manually (absolutely prohibited, just exceptionnaly by `1718-io`'s cloud team admins)

We have to run early integration tests for the `1718-io`, even before our pipelines are ready.

For a start, we want to run intregrations tests using the source code version`identiffied by the hash commit  `b742b55bfb7afe77dbba1f305f6d527bb0629aef`.

Here is how we carry out those test operations, and you can at any time re-run

* go to github, to [the Github Pages configuration section](https://github.com/1718-io/ethical-hacking-example/settings/pages) of this repo, and reset the github pages deployment git branch to `monkey/tests-integration`
* and run :

```bash

export GH_PAGES_DEPLOYMENT_GIT_BRANCH=${GH_PAGES_DEPLOYMENT_GIT_BRANCH:-"monkey/tests-integration"}
export GH_PAGES_DEPLOYMENT_CNAME=${GH_PAGES_DEPLOYMENT_CNAME:-"1718-io.github.io/ethical-hacking-example"}
export COMMIT_HASH_TO_TEST=${GH_PAGES_DEPLOYMENT_CNAME:-"b742b55bfb7afe77dbba1f305f6d527bb0629aef"}

git clone git@github.com/1718-io:ethical-hacking-example.git
cd ./ethical-hacking-example/
# We deltee the git branch if it already exists ?
git checkout master
git push --delete origin ${GH_PAGES_DEPLOYMENT_GIT_BRANCH} && git branch -D ${GH_PAGES_DEPLOYMENT_GIT_BRANCH}

git checkout ${COMMIT_HASH_TO_TEST}

git checkout -b ${GH_PAGES_DEPLOYMENT_GIT_BRANCH} && git push -u origin HEAD

# ------------------------------------------------------
# then i added the package.json and
# the [./.npm.scripts] folder with all its content
# ------------------------------------------------------
npm run preps:all

# ------------------------------------------------------
# then i configured the package.json and
# the [./.npm.scripts] folder with all its content
# ------------------------------------------------------
# ------------------------------------------------------
# then i deployed the package.json and
# the [./.npm.scripts] folder with all its content
# --------------------------------------------------
npm run deploy:gh_pages:prod

```
* running `npm start` runs a local server.
* running `npm run deploy:surge:dev` deploys to https://surge.sh , on a subdomain of the `surge.sh` domain.

## `npm` commands Overview

```bash

npm run clean
npm run preps:deploy:gh_pages
npm run preps:deploy:heroku


npm run preps
npm run preps:all
npm run preps:g
npm run preps:dev

npm run test
npm run test:dev
npm run test:prod
npm run build:dev
npm run build:dev
npm run build:prod
npm run start


```

## Contributors Quickie

### The Git Flow

We use the pure git flow, AVH Edition, with its full defaults configuration.

* Begin working on a new feature :

```bash
export WHERE_YOU_WORK=~/.livestreams-landing-page.dev.work
export MON_PTI_NOM_DS_LEQUIPE="jbl"
export FEATURE_ALIAS=${MON_PTI_NOM_DS_LEQUIPE}-ajout-bouton-rouge

git clone git@github.com:1718-io/ethical-hacking-example.git ${WHERE_YOU_WORK}
cd ${WHERE_YOU_WORK}/documentation/hugo
git checkout master

git flow init --defaults
# Now you are automatically on the develop git branch

git flow feature start ${FEATURE_ALIAS} && git push -u origin --all
# Now you are automatically on the "feature/${FEATURE_ALIAS}" git branch

# Ok, now You modify source code

# And then you git push to your git branch
export MSG_DE_COMMIT="j'explique ce que j'ai fais dans le code"
export MSG_DE_COMMIT="Add `< Framework Name >` base project source code + dockerfile + doc"
git add -A && git commit -m "${MSG_DE_COMMIT}" && git push -u origin HEAD

```

* Resume working on an already started feature :

```bash
export WHERE_YOU_WORK=~/.livestreams-landing-page.dev.work
export MON_PTI_NOM_DS_LEQUIPE="jbl"
export FEATURE_ALIAS=${MON_PTI_NOM_DS_LEQUIPE}-ajout-bouton-rouge

git clone git@github.com:1718-io/ethical-hacking-example.git ${WHERE_YOU_WORK}
cd ${WHERE_YOU_WORK}/documentation/hugo
git checkout master
# You need to re-initialize the git flow, every tim you git clone: git flow is git hooks based
git flow init --defaults
git checkout feature/${FEATURE_ALIAS}
# You are now on your feature branch : "feature/${FEATURE_ALIAS}"

# Ok, now You modify source code
export MSG_DE_COMMIT="j'explique ce que j'ai fais dans le code"
# And then you git push to your git branch
git add -A && git commit -m "${MSG_DE_COMMIT}" && git push -u origin HEAD

```

Now, To see the result of your code, you will build n run locally first :

### How to Build n run locally

* How to build and run locally using ``< Framework Name >`-cli` :

```bash
# Build n Run commands here
```

* _(coming soon):_ Or use docker-compose, without live reloading feature of `< Framework Name >` (when developers wnat to test CORS or nasty webserver configurations) :

```bash
docker-compose up -d
# and then go to http://localhost:4242
```

### When your work is ready to submit for validation

You create a PR from your PR's Git branch, to the `develop` Git branch.

**Don't forget to squash your commits** :

[Coming soon : an `ascii-cinema` demo of a sauash + we will have workshops ]


### If you validate a PR submitted by a developer

* **`STEP 1`**: You test the PR git branch by runing it locally, just like the developer did.
* **`STEP 2`**: You check, on Github for example, if there are merge conflicts. if so, you ask the developer to solve the merge conflicts, squash his commits, and you're back to **STEP 1**
* **`STEP 3`**: You merge the pull request **LOCALLY Only (warning!)** , and run the website locally again, but from branch `develop` (testing AFTER the merge)
* **`STEP 4`**: You merge the pull request on Github This time, which will deploy to `staging-1718-io.github.io/ethical-hacking-example`
* **`STEP 5`**: You Check that you get on Discord, the message from the `1718-io` Bot, taht the deployment succesfully completed, and you check that by clicing ton the http link provided by the `1718-io` Bot, you do get the newly deployed source code
* **`STEP 6 (The Bot Kiss Principle)`**: You don't have to do anything, th `1718-io` Bot already notified all the persons that were waiting for your deployment to validate the result


### Overview of CICD Workflow

We will use 2 CICD Systems as falback of each other :
* Circle CI
* Drone CI

That's why you will find both a `.drone.yml` and a `.circleci/config.yml` into the repo.

The deployments are made :
* by Either Circle CI or Drone CI,
* to `<name of yourgit branch>-1718-ethhacking.surge.sh` for the dev PR git branches
* to `staging-1718-ethhacking.surge.sh` for the `develop` git branch

More will come soon...

### ANNEX A : The tech stack

* `git` / `git flow AVH edition`
* `nodejs` / `npm`
* `< Framework Name >` Stack (`< Framework Name >` `10` ?)
* `Docker`
* `Docker Compose`

The Stack tools' versions used to locally run during, the dev workflow :

```bash
me@~$ docker version
Client: Docker Engine - Community
 Version:           19.03.6
 API version:       1.40
 Go version:        go1.12.16
 Git commit:        369ce74a3c
 Built:             Thu Feb 13 01:27:59 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.6
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.16
  Git commit:       369ce74a3c
  Built:            Thu Feb 13 01:26:33 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.2.12
  GitCommit:        35bd7a5f69c13e1563af8a93431411cd9ecf5021
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
me@~$ docker-compose version
docker-compose version 1.25.2, build 698e2846
docker-py version: 4.1.0
CPython version: 3.7.5
OpenSSL version: OpenSSL 1.1.0l  10 Sep 2019
me@~$ git version
git version 2.11.0
me@~$ git flow version
1.10.2 (AVH Edition)
me@~$ node -v
v16.13.0
me@~$ npm --version
8.2.0

```

How to install :

* `git` : see official site
* `git flow AVH edition` : https://github.com/petervanderdoes/gitflow-avh
* `nodejs` / `npm` : see official site
* `< Framework Name >` Stack (`< Framework Name >` `10` ?) : see build instructions
* `Docker` : see official site
* `Docker Compose` : see official site

## ANNEX B : More on the Git flow

* How to install the git flow on your machine :
* A beautiful Git Flow Cheatsheet : https://danielkummer.github.io/git-flow-cheatsheet/
* And we will have workshops together live of course !

##  ANNEX C : `< Framework Name >` Environments

Are there to share variables between environments, but cahnge their values across environments.

`< Framework Name >` Environments are designed following this pattern : https://dev.to/nikosanif/using-shared-settings-between-multiple-environments-in-`< Framework Name >`-1d0e

`< Framework Name >` Environments :
* are linked by devops automation, to the `.env.dev`, `.env.staging`, `.env.prod` environment files
* using interpolation of variables, in shell scripts using `nodejs` `npm` packages



`.env.dev`
`.env.staging`
`.env.prod`


| Environment | `< Framework Name >` Files | Devops Files   | Deployment Target DNS name | Misc. comments                 |
|-------------|---------------|----------------|----------------------------|--------------------------------|
| ccccccccccc | ccccccccccccc | `.env.dev`     | cccccccccccccccccccccccccc | cccccccccccccccccccccccccccccc |
| ccccccccccc | ccccccccccccc | `.env.staging` | cccccccccccccccccccccccccc | cccccccccccccccccccccccccccccc |
| ccccccccccc | ccccccccccccc | `.env.prod`    | cccccccccccccccccccccccccc | cccccccccccccccccccccccccccccc |


<!--

## Contributors Quick

### The Git Flow

### How to run locally

### Overview of CICD Workflow

## ANNEX A : More on the Git flow

-->


##  ANNEX C : `< Framework Name >` Tests


### `< Framework Name >` CLI: Running only unit tests

Run `# test commands here` to execute the unit tests via [Karma](https://karma-runner.github.io).

#### `< Framework Name >` CLI: Running only end-to-end tests

Run `# e2e end-to-end tests commands here` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

#### `< Framework Name >` CLI: Further help

To get more help on the `< Framework Name >` CLI got to https://example.com/link/to/refenrece/doc
