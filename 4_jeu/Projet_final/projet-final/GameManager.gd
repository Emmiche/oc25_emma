extends Node

var labyrinthe_fini = false
var quiz_fini = false
var parcours_fini = false

# @onready var animation_player = $"../AnimationPlayer"

func verifier_fin():

	if labyrinthe_fini and quiz_fini and parcours_fini:

		print("Tous les niveaux terminés !")

		# animation_player.play("AnimationFinale")
