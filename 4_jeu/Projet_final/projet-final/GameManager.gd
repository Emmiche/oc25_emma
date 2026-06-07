# Attaché au nœud Main.
# Il joue le rôle de GameManager :
# il mémorise les niveaux terminés et lance l'animation/vidéo finale
extends Node3D

# Variable indiquant si le niveau Labyrinthe est terminé.
# false = non terminé
# true = terminé
var labyrinthe_fini = false
var quiz_fini = false # Variable indiquant si le niveau Quiz est terminé
var parcours_fini = false # Variable indiquant si le niveau Parcours est terminé

# Cette variable sert à empêcher la vidéo finale de se lancer plusieurs fois
var fin_deja_jouee = false

# Récupère automatiquement le nœud AnimationFinale lorsque la scène est chargée
# @onready signifie :
# "attends que l'arbre de scène soit prêt avant de chercher ce nœud".
# AnimationFinale est ici un VideoStreamPlayer.
@onready var animation_finale = $CanvasLayer/AnimationFinale

# Fonction appelée par les différents niveaux lorsqu'ils sont terminés
func verifier_fin():

	# Affiche l'état actuel des trois niveaux dans la console pour vérifier que tout fonctionne
	print("Labyrinthe :", labyrinthe_fini)
	print("Quiz :", quiz_fini)
	print("Parcours :", parcours_fini)

	# Si la vidéo finale a déjà été jouée on arrête immédiatement la fonction
	# Eviter que la vidéo se relance
	if fin_deja_jouee:
		return

# Si on a bien terminé les trois niveaux, alors ...
	if labyrinthe_fini and quiz_fini and parcours_fini:

# On mémorise que la fin a été jouée
		fin_deja_jouee = true

		print("Tous les niveaux terminés !") # test pour voir si fonctionne

		# Rend visible le VideoStreamPlayer
		# Utile s'il était caché au début du jeu
		animation_finale.visible = true
		animation_finale.play() # Animation finale se lance
