# attaché à un Area3D
# L'Area3D sert ici à détecter quand le joueur entre dans la zone de fin du quiz
extends Area3D

# Variable qui indique si le joueur est actuellement dans la zone.
# false = non, true = oui
var joueur_proche = false

# Fonction appelée automatiquement lorsque un corps physique (CharacterBody3D, RigidBody3D, etc.) entre dans l'Area3D
func _on_body_entered(body):
	print("Quelqu'un est entré :", body.name) # test

# Vérifie que l'objet entré est bien le joueur
	if body.name == "Player":
		joueur_proche = true # On indique que le joueur est dans la zone

# Fonction appelée automatiquement lorsqu'un corps quitte l'Area3D
func _on_body_exited(body):

# Vérifie que c'est bien le joueur qui sort
	if body.name == "Player":
		joueur_proche = false # Le joueur n'est plus dans la zone

# Fonction appelée à chaque image du jeu
# delta = temps écoulé depuis l'image précédente
func _process(delta):

# vérifie 2 conditions : si on est dans l'Area3D et qu'on appuie sur E (interact)
	if joueur_proche and Input.is_action_just_pressed("interact"):

		# Récupère la scène actuellement chargée, ici c'est main
		var gm = get_tree().current_scene

	# Indique au GameManager que le quiz est terminé
		gm.quiz_fini = true

		# Demande au GameManager de vérifier si les trois niveaux sont terminés
		gm.verifier_fin()

# Message de débogage dans la console + pour tester si ça marche
		print("Quiz terminé")
