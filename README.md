# POKA-PRESSE
POKA PRESSE est une société de presse qui conçoit, réalise et publie des magazines vendus sur tout le territoire français (métropole et DOM-TOM). Le dernier titre mis sur le marché par POKA PRESSE est le magazine mensuel « SAVOIR VENDRE ». Ce magazine très spécialisé vise un public de vendeurs qu'il a pour objectif de conseiller dans l'exercice de leur métier.
POKA PRESSE souhaite se doter d'un intranet pour assurer une meilleure coopération et une communication plus rapide entre les différents acteurs (rédacteurs, pigistes, maquettistes) participant à l'élaboration de ses publications. La revue SAVOIR VENDRE a été choisie pour expérimenter cette nouvelle forme de travail.

## Consignes générales
Le but du projet est d’aborder les différentes étapes de conception d’une base de données mise à disposition d’une application, depuis le cahier des charges du client jusqu’à l’implémentation d’un site web utilisant la base de données.

### Modélisation 
La première étape consiste à modéliser sous la forme d’un schéma entité-association une base de données répondant aux attentes du cahier des charges du client, ici représenté par l’énoncé de votre sujet. Attention, le cahier des charges peut être incomplet ou contenir des ambiguïtés, comme ce serait le cas en situation réelle. Il est de votre responsabilité de demander des précisions à votre client lorsque nécessaire.
Votre schéma entité-association devra être accompagné d’un court texte justifiant les éventuels choix ou hypothèses que vous avez été amenés à faire, les compléments apportés directement par le client, et les contraintes que votre modèle ne peut pas garantir et qui devront être vérifiées dans les parties suivantes.
Le schéma pourra être dessiné soigneusement à la main ou construit avec l’outil informatique de votre choix.

### Création de la base de données
La seconde étape consiste à traduire le modèle conceptuel de l’étape 1 vers le modèle relationnel puis à l’implémenter sous postgres. Vous devrez créer dans votre base de données étudiant les tables requises par votre schéma relationnel et choisir les types de données et contraintes appropriées. Vous remplirez ensuite les différentes tables de votre base. Les données utilisées peuvent être factices mais devront être choisies de sorte à mettre en avant tous les cas d’utilisation de votre base.
Lors de cette seconde étape, votre client pourra éventuellement préciser le cahier des charges ou ajouter des demandes spécifiques. Nous supposerons qu'il est maintenant trop tard pour modifier le schéma qui a été validé. Il faudra trouver une autre manière de répondre aux attentes du client.
Second rendu :
- dump complet de votre base (y compris les créations de tables)
- mini rapport avec le schéma relationnel corrigé, un court texte justifiant les types de données et contraintes choisies ainsi que votre réponse aux demandes supplémentaires du client.

### Mise en place du site web
Dans cette dernière étape, vous finirez de remplir votre base de données et vous mettrez en place la partie web de votre projet en respectant le cahier des charges fourni.
Le cahier des charges étant souvent très léger (un client ne sait pas toujours très bien ce qu’il veut), vous ferez preuve d’initiative pour apporter des fonctionnalités additionnelles qui vous semblent utiles. Plus le cahier des charges est mince, plus vous aurez besoin de faire preuve d’initiative !
Votre rendu pour cette dernière partie sera composé de :
1. Un lien permettant d’accéder à la page d’accueil de votre site web. N’oubliez pas de fournir aussi tous les éléments utiles pour tester votre site, notamment nom d’utilisateur et mot de passe, si le site requiert une authentification. Attention, votre site web doit fonctionner sur le serveur de l’université.
2. Une archive des pages web (php/html) ainsi qu’un nouveau dump de votre base (si celui-ci a été modifié après la partie 2) en précisant la nature des modifications.
3. Un rapport final de 5 à 10 pages environ obligatoirement au format pdf. Ce rapport contiendra :
— Une petite présentation du projet avec un petit manuel utilisateur ;
— Une section technique reprenant les présentations des étapes 1 et 2 ;
— Une description technique des fonctionnalités du site web, présentant notamment quelques unes des requêtes SQL utilisées (les plus intéressantes d’un point de vue fonctionnel ou technique), leur fonctionnement et leur utilité ;
— D’éventuelles pistes d’améliorations de votre travail ;
