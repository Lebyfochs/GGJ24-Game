extends Area2D

@onready var game_manager = $"../GameManager"

var collecting

# Called when the node enters the scene tree for the first time.
func _ready():
	
	collecting = false;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collecting == true:
		game_manager.add_gas()
		
	if game_manager.player_gas >=50:
		collecting = false
		
	


func _on_body_entered(body):
	if(body.name == "CharacterBody2D"):
			collecting = true
		


func _on_body_exited(body):
	collecting = false
