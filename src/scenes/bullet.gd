extends RigidBody2D


const SPEED = 300.0
var direction = Vector2(1,0)


func _physics_process(delta):
	#position = position + SPEED * direction * delta

	pass


func _on_body_entered(body):
		queue_free()
