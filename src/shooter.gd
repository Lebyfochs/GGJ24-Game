extends Area2D

@onready var game_manager = $GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()


#Shoots laughing gas from the player.
func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	#k new_bullet.global_position = new_bullet.direction
	owner.add_child(new_bullet)
	
	
