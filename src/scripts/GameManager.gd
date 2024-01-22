extends Node


enum GameStates
{
	MENU,
	PLAYING,
	GAMEOVER,
	QUITTING
}

var player_gas
var king_gas
var gas_depleter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	player_gas = 0
	king_gas = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(king_gas)
	king_gas -= 0.01

#For collecting gas.
func add_gas():
	player_gas += 1
	
	#Gives the King gas if he doesn't already have max amount.
func give_gas():
	if player_gas > 0 && king_gas < 50:
		king_gas += 1
		player_gas -= 1
