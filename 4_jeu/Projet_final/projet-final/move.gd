@tool
# Attaché une CSGBox qui bougera
extends CSGBox3D

# Distance maximale du mouvement par rapport à la position de départ
@export var amplitude := 1.0
# Nombre d'allers-retours par seconde
@export var frequence := 1.0

# Temps écoulé depuis le début du mouvement
var t := 0.0
# Position Z initiale de la plateforme, elle sera mémorisée au lancement
var start_z := 0.0
# Permet de savoir si l'initialisation a déjà été faite.
# Évite de réenregistrer la position de départ à chaque image
var initialized := false

# Fonction appelée après chaque image
# delta = temps écoulé depuis l'image précédente
func _process(delta: float) -> void:

	# Initialisation UNE seule fois
	if not initialized:
		# On mémorise sa position Z actuelle, permet de conserver la position choisie dans l'éditeur Godot
		start_z = position.z
		initialized = true # Initialisation terminée

	# On ajoute le temps écoulé à chaque frame
	t += delta

# Mouvement sinusoidale
	# sin() produit une valeur oscillant entre -1 et +1.
	# t * frequence : contrôle la vitesse de l'oscillation.
	# 2 * PI : permet d'obtenir un cycle complet.
	# * amplitude : agrandit ou réduit le mouvement.
	# + start_z : recentre le mouvement autour de la position initiale de la plateforme
	position.z = start_z + sin(t * frequence * 2.0 * PI) * amplitude
