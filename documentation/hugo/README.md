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

### (UAT Deployment PR branches) Deploy to github pages

```bash
# --
export DEPLOYMENT_BASE_URL=https://1718-io.github.io/ethical-hacking-example/

```

### (Release) Deploy to github pages

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
