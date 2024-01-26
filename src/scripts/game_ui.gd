extends CanvasLayer

#For modifying the status bars.
@onready var game_manager = $"../GameManager"
@onready var player_gas_bar = $PlayerGasBar
@onready var king_gas_bar = $KingGasBar
@onready var player_score_ui = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	player_gas_bar.set_value(game_manager.player_gas)
	king_gas_bar.set_value(game_manager.king_gas)
	
	#str converts the int to string? Allows to display the value.
	player_score_ui.text = str(game_manager.player_score)
	
	

