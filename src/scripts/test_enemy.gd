extends RigidBody2D

@onready var _animation_player = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_animation_player.play("idle")


#Destroys enemy object.
func enemy_death():
	queue_free()

