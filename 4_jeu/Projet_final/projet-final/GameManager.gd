extends Node3D

var labyrinthe_fini = false
var quiz_fini = false
var parcours_fini = false

var fin_deja_jouee = false

@onready var animation_finale = $CanvasLayer/AnimationFinale

func verifier_fin():

	print("Labyrinthe :", labyrinthe_fini)
	print("Quiz :", quiz_fini)
	print("Parcours :", parcours_fini)

	if fin_deja_jouee:
		return

	if labyrinthe_fini and quiz_fini and parcours_fini:

		fin_deja_jouee = true

		print("Tous les niveaux terminés !")

		animation_finale.visible = true
		animation_finale.play()
