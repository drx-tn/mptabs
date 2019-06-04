# MPTabs [![Launchpad.net !](http://media.launchpad.net/lp-badge-kit/launchpad-badge-w120px.png)](https://launchpad.net/mptabs)
[![Licence](https://img.shields.io/github/license/drx-tn/mptabs.svg)](LICENSE) [![Etat du build sur Travis](https://travis-ci.org/drx-tn/mptabs.svg?branch=master)](https://travis-ci.org/drx-tn/mptabs) [![Etat du build sur Appveyor](https://ci.appveyor.com/api/projects/status/usg9qx1bejcilxce/branch/master?svg=true)](https://ci.appveyor.com/project/drxtun61291/mptabs/branch/master) [![Dernière version](https://img.shields.io/github/release/drx-tn/mptabs.svg)](https://github.com/drx-tn/mptabs/releases/latest) [![Nombre de téléchargements](https://img.shields.io/github/downloads/drx-tn/mptabs/total.svg)](https://github.com/drx-tn/mptabs/releases)

<p align="center"><img src="mptabs.svg" width="300"/></p>

<p align="center"><a href='https://play.google.com/store/apps/details?id=tn.drx.mptabs'><img alt='Disponible sur Google Play' width="200" src='https://play.google.com/intl/en_us/badges/images/generic/fr_badge_web_generic.png'/></a></p>

## A propos
Application tableaux des maladies professionnelles en Tunisie. Application gratuite avec code source ouvert (voir [licence GPL-3](LICENSE)).

Application inspirée et utilisant des documents publiés par l'[Institut de Santé et de Sécurité au Travail](http://www.isst.nat.tn).

La version en ligne est disponible sur: http://mptabs.drx.tn

> En savoir plus sur le projet: https://drx.tn

> Rapporter des bugs ou des erreurs: https://github.com/drx-tn/mptabs/issues

## Installation
Vous trouverez des programmes d'installation en téléchargement pour Windows 32 bits (`mptabs*_x86.exe`) et 64 bits (`mptabs*_x64.exe`), Mac Os et Android sur la page [releases](https://github.com/drx-tn/mptabs/releases).

Sous Ubuntu Bionic, Cosmic, Disco et Eoan vous pouvez installer l'application en ajoutant le ppa [ppa:drx.tn/ppa](https://launchpad.net/~drx.tn/+archive/ubuntu/ppa) à vos sources de mises-à-jour puis en l'installant avec ces commandes:

    sudo add-apt-repository -y ppa:drx.tn/ppa
    sudo apt-get update
    sudo apt-get install -y mptabs

Pour les autres versions de linux vous devez compiler l'application par vous même.

## Compilation à partir de la source
> Pour compiler l'application pour Windows/Linux/Mac vous aurez besoin de [Qt](https://www.qt.io/download-qt-installer) et pour Android [Android Studio ou les outils en ligne de commande](https://developer.android.com/studio/#downloads).

La première étape consiste à cloner ce dépôt et à se diriger à l'intérieur du dossier `mptabs`:

    git clone https://github.com/drx-tn/mptabs
    cd mptabs

L'application a quelques dépendances supplémentaires qui ont été intégrées sous forme de sous-modules et qui sont:
* Le framework [UIkit](https://getuikit.com/) (version 3.1.4),
* Le polyfill [Fetch](https://github.github.io/fetch/) (version 2.0.4)
* Et [PDF.js](https://mozilla.github.io/pdf.js/) (version 2.1.266)

Il faudra donc les intégrer par la commande:

    git submodule update --init --recursive

Ou bien plus rapidement en omettant l'historique des dépôts (switch `--depth`):

    git submodule update --init --recursive --depth 1

### Sous Linux

A partir de Qt Creator ou en ligne de commande avec:

    qmake -config release
    make

Sous Linux vous pouvez ensuite installer l'application avec:

    sudo make install

### Sous Windows

A partir de Qt Creator ou en ligne de commande avec:

    qmake -config release
    nmake                 # Commande à utiliser si vous utilisez MSVC
                          # ou autre si vous utilisez un autre environnement.

Vous pouvez ensuite déployer l'application avec:

    windeployqt qt\release

> Pour compiler le programme d'installation sous Windows il vous faudra [NSIS](http://nsis.sourceforge.net).

Pour compiler le programme d'installation il faudra tout d'abord nettoyer le dossier `qt/release` avec:

    nmake clean           # Commande à utiliser si vous utilisez MSVC
                          # ou autre si vous utilisez un autre environnement.

puis compiler le script NSIS avec:

    makensis VERSION ARCHITECTURE mptabs.nsi       # vous pouvez mettre ou pas ces 2 variables.

### Sous Mac

> Bien que ça n'a pas été testé ces étapes devraient marcher. :wink:

A partir de Qt Creator ou en ligne de commande avec:

    qmake -config release
    make

Pour déployer l'image d'installation il suffit d'utiliser `macdeployqt`:

    macdeployqt qt/mptabs.app -dmg

### Compilation de l'application Android

A partir d'Android Studio ou en ligne de commande avec `gradlew`:

* Sous windows:

      gradlew.bat assembleRelease

* Sous Linux ou Mac:

      ./gradlew assembleRelease