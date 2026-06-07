extends Area3D

var joueur_proche = false

func _on_body_entered(body):
	print("Quelqu'un est entré :", body.name) # test

	if body.name == "Player":
		joueur_proche = true

func _on_body_exited(body):

	if body.name == "Player":
		joueur_proche = false

func _process(delta):

	if joueur_proche and Input.is_action_just_pressed("interact"):

		var gm = get_tree().current_scene

		gm.quiz_fini = true

		gm.verifier_fin()

		print("Quiz terminé")
