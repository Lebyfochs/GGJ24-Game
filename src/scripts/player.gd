extends CharacterBody2D


@onready var _animation_player = $AnimatedSprite2D
@onready var game_manager = $"../GameManager"
@onready var player_camera = $Camera2D

#@export var bullet : PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

<<<<<<< HEAD

=======
var BULLET_PATH = preload("res://scenes/bullet.tscn")
>>>>>>> 528f0a2362816b0facd4b2ab630bab350cde13e3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var body

func _physics_process(delta):
	
	#Collision with enemy
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().name == "RigidBody2D":
			queue_free()
			game_manager.current_game_state = game_manager.GameStates.GAMEOVER
		
#		if collision.get_collider().name == "GasCollector":
#			pass
	
	# Add the gravity.
	#Implement Coyote Time.
	if not is_on_floor():
		velocity.y += gravity * delta
		_animation_player.play("jump")
		

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_released("jump"):
		_animation_player.play("jump")
		
		
		
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		player_move(direction)
		
		if direction <= -1:
			_animation_player.flip_h = true
		
<<<<<<< HEAD
	#elif Input.is_action_just_pressed("attack"):
		#player_attack(Vector2(0,4))	
=======
	elif Input.is_action_just_pressed("attack"):
		player_attack(Vector2(1,0,))	
>>>>>>> 528f0a2362816b0facd4b2ab630bab350cde13e3
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animation_player.play("idle")
		_animation_player.flip_h = false
		
		
		
	move_and_slide()
	
	player_camera.set_limit(SIDE_TOP, -80)
	player_camera.set_limit(SIDE_LEFT, -5)
	player_camera.set_limit(SIDE_RIGHT, 2750)

#Movement function.	
func player_move(DIR):
	velocity.x = DIR * SPEED
	_animation_player.play("run")	
	
<<<<<<< HEAD


=======
#Player attack function, shoots the laughing gas.	
func player_attack(bullet_DIR):
	var bullet = BULLET_PATH.instantiate()
	bullet.position = bullet_DIR
	add_child(bullet)
>>>>>>> 528f0a2362816b0facd4b2ab630bab350cde13e3
	
	
			
