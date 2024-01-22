extends Node


var player_gas
var king_gas
var gas_depleter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	player_gas = 0
	king_gas = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(player_gas)

func add_gas():
	player_gas += 1
	
func give_gas():
	if player_gas > 0 && king_gas < 50:
		king_gas += 1
		player_gas -= 1
