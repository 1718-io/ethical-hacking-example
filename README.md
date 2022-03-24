# Avez-vous entendu parler de  https://controlecitoyenelection.com/  ?

* Dans [cette vidéo YouTube](https://www.youtube.com/watch?v=wbJ3pvV0-xc&t=2537s), les tenants de l'infrastructure derrière le site internet https://controlecitoyenelection.com/ :
  * décrivent le mécanisme par lequel ils prétendant fournir aux Français, un moyen de contre -èvérificatiuon du résultat des électtions
  * vous trouverez dans ces explications, un nombre simplemnt affolant de contre-vérités, de non-sens et d'absurdités littéralement incroyables, là où la même époque se penche sur des tehcnologies comme la blockchain ou la cryptographie ZKP (Zero Knowledge Proof) pour mettre en oeuvre de tels systèmes de vérification de l'intégrité d'un vote.
* Dans [cette vidéo YouTube](https://www.youtube.com/watch?v=N8fB5bPjOyc&t=33s), les tenants de l'infrastructure derrière "":
  * expliquent que le serveur `STMP` "est tombé": ce serveur est utilisé pour envoyer des emails de confirmation, dans le process d'inscription ("registration")
  * expliquent qu'un site internet recevant 70 000 connexions par heure "cela ne s'est jamais vu" : ridicule affirmation, y compris parmiu les "citoyens résistants", plsuieurs ont déjà monté des sites internet prenant des charges beaucoup plus importantes (j'ai personnellement vécu jusqu'à plusieurs millions de connexions par heure)

Le diffuseur de ce contenu est connu sur les réseaux sociaux sous le sobriquet de "`Chamanjo`".

Et pendant que les algorithmes des réseaux sociaux permettent de diffuser massivement à es dizaines de milliers de Citoyens Français honnêtes, ces informations au minimum complètement fausses et stupides, il n'existe aucun professionnel de notre métier, pour venir explique rationnellement au Citoyen Français, ce qu'il est parfaitement capable de comprendre.

Dans cette situation, et face à la colère initiale homérique, qui a été la mienne, j'ai décidé d'adopter l'arme de la Plume, et de l'Esprit, pour défaire l'ennemi de l'ignorance, et défendre l'Honneur de mes concitoyens Français, tous capables de la plus haute forme d'Intelligence, et du rafinement parmi les plus appréciés au Monde.

Pour l'Honneur de l'Esprit Humain.

Ainsi, ma démarche consistera à cultiver mon jardin (apprendre), tout en réalisant mon devoir de citoyen.

* Dans ce document, nous apprendrons donc :
  * À nous servir de multiples outils de sécurité, tels que `OpenDoor`
  * À mettre en oeuvre un cycle devops pour la gestion de la scurité : nous concevrons un cycle "DevSecOps"
  * À mettre en oeuvre une pratique de "Ethical Hacking":
    * Dès le début de ce travail (cf. date du premier commit sur `master`), avant même de découvrir la moindre vulnérabilité, j'informerai par envoi d'email, messages sur réseaux sociaux, le fameux "Chamanjo", ainsi que les tenants légaux de l'infrastructure derrière le site internet ""
    * À chaque vulnérabilité découverte :
      * J'enverrai un message de mise en deumeure aux tenants de l'infrastructure derrirère https://controlecitoyenelection.com/  , afin d'informer la plateforme de la vulnérabilmité découverte, et en donnant les solutions pour se protéger de la vulnérabilité
      * Dans tous les cas, 6 heures après la découverte de la vulnérabilité, la vulénrabilité sera intégralement publiqment publiée dans ce repo, avec moyena automatisé de reproduire une attaque exploitant la vumlnérabilité découverte.
      * Pour chaque vulnérabilité découverte, si les tenants derrière le site https://controlecitoyenelection.com/  , m'envoient un email ou ouvrent une issue sur Github dans ce repo, pour me demander d'attendre avant de publier la vulnérabilité, j'allongerai le délai de 6 heures, d'autant nécessaire pour résoudre le problème de sécurité.


J'ai enfin pu noter que d'autres "Collectifs connus", comme Réinfo Covid, "suivent de près" cette initiative.

À chaque vulnérabilité découverte, j'informerai donc aussi ces différents collectifs, après le délai de 6 heures échu.

## Le principal problème

Selon moi, le principal problème que pose l'initiative derrière https://controlecitoyenelection.com/ est le suivant:

* On prétend que cet "outil" permettrait de vérfier le résultat d'une élection comme l'ection présidentielle française.
* Mon but principal sera d'apporter la démonstration qu'au contraire de ce qui est affirmé à des dizaines de milliers de français sur les rseaux sociaux, cet "outil" ne permet en aucun cas de véfrfier le moindre résultat d'uen quelconque élection, et en particulier pas pour l'élection présidentielle Française.

## Techie

Okay now let's dive into serious stuff, first, i need a proper documentation to publish results of my study, and make it available to the non-technical reader (the everyday citizen) : that's gonna be a hugo static website, deployed to github pages.

### Working with the Github Pages static website

* the hugo website source code will be in the `documentation/hugo` folder
* the hugo website will be published to Github pages, in the `docs/` folder on `master` git branch, and source code will be in the `documentation/hugo` folder.


##### Run locally the hugo website

```bash

```


##### Deploy PR branches for the hugo website

We use surge.sh

```bash

```


##### Deploy the hugo website to Github Pages


```bash

```


##### How the hugo website source code was initialized


```bash
mkdir -p documentation/hugo/
git clone git@github.com:1718-io/ethical-hacking-example.git documentation/hugo/
cd documentation/hugo/
git checkout monkey/tests-integration

rm -fr ./.git/

npm run clean



```


## ANNEX A. `OpenDoor` Cheatsheet

To run OWASP security scanner with default dictionnaries, wordlists, and rainbows :

```bash
opendoor  --reports json,html --reports-dir radiojaune.com --host https://controlecitoyenelection.com
opendoor  --reports json,html --reports-dir radiojaune.com --host https://tekton.dev
opendoor  --reports json,html --reports-dir radiojaune.com --host https://kubernetes.io
```
