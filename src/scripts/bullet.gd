extends Area2D

const RANGE = 200
const SPEED = 1000
var distance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT
	position += direction * SPEED * delta
	
	distance += SPEED * delta
	if distance > RANGE:
		queue_free()
