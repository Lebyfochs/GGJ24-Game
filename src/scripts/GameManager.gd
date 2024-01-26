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

var time_add_up

var current_game_state

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Timer.start()
	player_gas = 0
	player_gas_MAX = 50
	player_score = 0
	gas_depleter = 0.01
	
	time_add_up = 0
	
	king_gas = 20
	king_gas_MAX = 50
	current_game_state = GameStates.MENU


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if king_gas <=0:
		current_game_state = GameStates.GAMEOVER
	
	match current_game_state:
		
		GameStates.MENU:
			if Input.is_action_just_pressed("press_play"):
				current_game_state = GameStates.PLAYING
		
		GameStates.PLAYING:
			
			get_tree().paused = false
			
			king_gas -= gas_depleter
			
			if player_gas > 0:
				player_gas -= 0.01
				
			if time_add_up == 30:
				difficulty_up()
				
			
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
	time_add_up += 1
	print(time_add_up)
	
func difficulty_up():
	time_add_up = 0	
	if (gas_depleter <= 0.5):
		gas_depleter += 0.005
