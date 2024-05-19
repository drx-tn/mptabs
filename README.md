# MPTabs
[![Licence](https://img.shields.io/github/license/drx-tn/mptabs.svg)](LICENSE) [![Dernière version](https://img.shields.io/github/release/drx-tn/mptabs.svg)](https://github.com/drx-tn/mptabs/releases/latest) <!--[![Nombre de téléchargements](https://img.shields.io/github/downloads/drx-tn/mptabs/total.svg)](https://github.com/drx-tn/mptabs/releases)-->

<p align="center"><img src="mptabs.svg" width="300"/></p>

## A propos
Application tableaux des maladies professionnelles en Tunisie. Application gratuite avec code source ouvert (voir [licence GPL-3](LICENSE)).

Application inspirée et utilisant des documents publiés par l'[Institut de Santé et de Sécurité au Travail](http://www.isst.nat.tn).

La version en ligne est disponible sur: http://mptabs.drx.tn

> En savoir plus sur le projet: https://drx.tn/mptabsapp

> Rapporter des bugs ou des erreurs: https://github.com/drx-tn/mptabs/issues


## Modifier le code source

Clonez ce dépôt et à dirigez-vous à l'intérieur du dossier `mptabs`:

    git clone https://github.com/drx-tn/mptabs
    cd mptabs

L'application a quelques dépendances supplémentaires qui ont été intégrées sous forme de sous-modules et qui sont:
* Le framework [UIkit](https://getuikit.com/),
* La librairie [Fuse.JS](https://www.fusejs.io/)
* Et [PDF.js](https://mozilla.github.io/pdf.js/)

Il faudra donc les intégrer par la commande:

    git submodule update --init --recursive

Ou bien plus rapidement en omettant l'historique des dépôts (switch `--depth`):

    git submodule update --init --recursive --depth 1