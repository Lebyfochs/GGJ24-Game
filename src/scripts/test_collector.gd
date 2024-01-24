extends Area2D

@onready var game_manager = $"../GameManager"

var collecting

# Called when the node enters the scene tree for the first time.
func _ready():
	
	collecting = false;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if collecting == true:
		game_manager.add_gas()
		
	if game_manager.player_gas >=game_manager.player_gas_MAX:
		collecting = false
		
	

#If player touching collector then collect gas.
func _on_body_entered(body):
	if(body.name == "Player"):
			collecting = true
		

func _on_body_exited(_body):
	collecting = false
