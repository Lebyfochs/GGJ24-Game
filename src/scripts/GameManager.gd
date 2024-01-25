extends Node

#@onready var timer = $Timer


enum GameStates
{
	MENU,
	PLAYING,
	GAMEOVER,
	QUITTING
}

var player_gas
var player_gas_MAX
var player_score
var king_gas
var king_gas_MAX
var gas_depleter

var current_game_state

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Timer.start()
	player_gas = 0
	player_gas_MAX = 50
	player_score = 0
	
	king_gas = 20
	king_gas_MAX = 50
	current_game_state = GameStates.PLAYING


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if king_gas <=0:
		current_game_state = GameStates.GAMEOVER
	
	match current_game_state:
		GameStates.PLAYING:
			#print(king_gas)
			
			
			
			king_gas -= 0.01
			
			if player_gas > 0:
				player_gas -= 0.01
				
			
		GameStates.GAMEOVER:
			get_tree().paused = true
			
	
#For collecting gas.
func add_gas():
	player_gas += 0.5
	
	#Gives the King gas if he doesn't already have max amount.
func give_gas():
	if player_gas > 0 && king_gas < king_gas_MAX:
		king_gas += 0.5
		player_gas -= 1
		
	if king_gas >= king_gas_MAX:
		up_score(1)	
		
func up_score(score_value):
	player_score += score_value		


func _on_timer_timeout():
	print("Hello")
