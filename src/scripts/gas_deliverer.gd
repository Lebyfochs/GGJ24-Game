extends Area2D

@onready var game_manager = $"../GameManager"

var delivering

# Called when the node enters the scene tree for the first time.
func _ready():
	delivering = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (delivering == true):
		game_manager.give_gas()

#Delivering gas upon collision.
func _on_body_entered(body):
	delivering = true
	


func _on_body_exited(body):
	delivering = false
	game_manager.player_score += 10
