extends CharacterBody2D

@onready var _animation_player = $AnimatedSprite2D

enum player_states
{
	IDLE,
	RUNNING,
	JUMPING,
	ATTACKING,
	COLLECTING
}

#var current_state = player_states.IDLE

const SPEED = 400.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	
#	match player_states:
#
#		player_states.RUNNING:
#
#			_animation_player.play("run")
#
#		player_states.JUMPING:
#			_animation_player.play("jump")
#
#		player_states.IDLE:
#			_animation_player.play("idle")
	
	
	# Add the gravity.
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
		velocity.x = direction * SPEED
		#current_state = player_states.RUNNING
		_animation_player.play("run")
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animation_player.play("idle")
		

	move_and_slide()
	#print(current_state)
	
			
			
