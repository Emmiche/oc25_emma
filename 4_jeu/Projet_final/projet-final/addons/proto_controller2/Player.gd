# Pour la téléportation : voir tuto "Godot Quick Tip - Teleporting" de MThelen
extends CharacterBody3D

# réglages
const SPEED := 5.0
const JUMP_VELOCITY := 4.5
const MOUSE_SENSIBILITY := 0.002

# gravité
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# ...
@onready var pivot_camera = $PivotCamera
@onready var camera = $PivotCamera/Camera3D

var rotation_x := 0.0 # rotation camera

func _ready():
	
	print("READY") # test
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # capture la souris dans la fenêtre
	
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")





	
func _input(event):
	print(event)
	
	if event is InputEventMouseMotion: # mouvement souris
		print("MOUSE") # test souris
		rotate_y(-event.relative.x * MOUSE_SENSIBILITY)
		
		rotation_x -= event.relative.y * MOUSE_SENSIBILITY
		rotation_x = clamp(rotation_x, deg_to_rad(-80), deg_to_rad(80))
		
		pivot_camera.rotation.x = rotation_x
	
	if event.is_action_pressed("ui_cancel"): # Echap = libérer la souris
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
 
func _physics_process(delta):
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("clic") # test
	

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Vector2.ZERO

	input_dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_dir.y = Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")

	var direction = Vector3.ZERO

	if input_dir != Vector2.ZERO:

		input_dir = input_dir.normalized()

		var forward = -transform.basis.z
		var right = transform.basis.x

		direction = (forward * input_dir.y + right * input_dir.x).normalized()

		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED

	else:

		velocity.x = 0
		velocity.z = 0

	# téléportation dans "transition_histoire"
	if Input.is_action_just_pressed("teleport1"):
		teleport_to("TeleportPoint1")

	# téléportation data center
	if Input.is_action_just_pressed("teleport2"):
		teleport2_to("TeleportPoint2")
		
	# téléportation quiz
	if Input.is_action_just_pressed("teleport3"):
		teleport3_to("TeleportPoint3")

	# téléportation parcours/plateforme
	if Input.is_action_just_pressed("teleport4"):
		teleport4_to("TeleportPoint4")	
		
	# téléportation labyrinthe
	if Input.is_action_just_pressed("teleport5"):
		teleport5_to("TeleportPoint5")	
		
	if Input.is_action_just_pressed("teleport6"):
		teleport6_to("TeleportPoint6")	
		
	if Input.is_action_just_pressed("teleport7"):
		teleport7_to("TeleportPoint7")	
		
	if Input.is_action_just_pressed("teleport8"):
		teleport8_to("TeleportPoint8")	

	move_and_slide()

func teleport_to(TeleportPoint1):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint1).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport2_to(TeleportPoint2):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint2).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")

func teleport3_to(TeleportPoint3):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint3).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport4_to(TeleportPoint4):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint4).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport5_to(TeleportPoint5):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint5).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport6_to(TeleportPoint6):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint6).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport7_to(TeleportPoint7):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint7).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
	
func teleport8_to(TeleportPoint8):

	# fade noir
	$CanvasLayer/FadeAnimationPlayer.play("FadeOut")

	# attendre fin animation
	await $CanvasLayer/FadeAnimationPlayer.animation_finished

	# arrêter le mouvement
	velocity = Vector3.ZERO

	# téléporter
	global_position = get_parent().get_node(TeleportPoint8).global_position

	# fade retour
	$CanvasLayer/FadeAnimationPlayer.play("FadeIn")
