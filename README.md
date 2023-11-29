# game_paper_clic
A new Flutter project.

## Cloner le projet
``` 
git clone url
```

## _Objectifs_:
1- Clique sur chaque ressource pour récolter une unité

2- Débloque des recettes et de nouveaux éléments de gameplay pour progresser dans le jeu

Découpage de l'application

1- Page d'accueil dont le titre est ressources
	- Démarre le jeu direct
	- Widget GridView pour présenter les ressources disponibles
	- Widget Ressource
		- rectangle de couleur sur la gridView
		- label Miner
	- le bouton est cliqué, 1 unité est récoltée
	- Total de ressources récoltées

2- Ajouter un bouton dans l'AppBar de la route Ressources pour naviguer vers une nouvelle Route Recettes
	- Utilisation d'une méthode de navigation
	- https://fonts.google.com/icons pour les icones
	- Cette route doit afficher toutes les recettes du jeu dans une ListView
	
3- Chaque Recette : Nom, sa description, son coût en ressources
	- Ajouter le bouton Produire pour produire l'objet
	- Un objet produit est ajouté à l'inventaire
	
4- Bouton Produire : 
	- Si ressources pas suffisantes, on ne peut pas produire l'objet
	- Donné un look disabled si la recette n'est pas disponible
	
5- Ajouter un bouton dans l'AppBar de la route Ressources pour naviguer vers une nouvelle Route Inventaire
	- cette route doit afficher tous les items produits sur la route Recettes dans une ListView

6- joueur a fabriqué 1000 lingots de fer et 1000 lingots de cuivre, la nouvelle ressource à récolter Charbon est affiché et disponible dans la route Ressources

7- Ajouter un bouton dans l'AppBar de la route Inventaire pour permettre de trier l'inventaire par nom
 - Ajouter un bouton dans l'AppBar de la route Inventaire pour permettre de trier l'inventaire par quantité
 
 8- Ajouter un nouvel élément de gameplay : 
  - une nouvelle page
  - une nouvelle action
  - une nouvelle interaction
  - une nouvelle recette
  
 9 - Pensez à l'automatisation de l'application
 	- un Mineur extrait 3 items/seconde 
 	- une fonderie transforme 1 minerai brut/seconde
 !!!!! Attention : On ne peut pas construire plus de mineurs qu'il y a de type de ressources.
 
 Implémenter les recettes Mineur et Fonderie dans le jeu
 
##  Références/Ressources
- Liste des ressources qui ont servies
##

## Difficultés
- Les difficultés rencontrées


## Choix Design/Implémentation
- Choix de conception
