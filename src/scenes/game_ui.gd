extends CanvasLayer

#For modifying the status bars.
@onready var game_manager = $"../GameManager"
@onready var player_gas_bar = $PlayerGasBar
@onready var king_gas_bar = $KingGasBar


var ui_player_gas
var ui_king_gas
var ui_player_gas_MAX
var ui_king_gas_MAX

# Called when the node enters the scene tree for the first time.
func _ready():
	ui_player_gas = game_manager.player_gas
	ui_king_gas = game_manager.king_gas
	ui_player_gas_MAX = game_manager.player_gas_MAX
	ui_king_gas_MAX = game_manager.king_gas_MAX
	
	player_gas_bar.max_value = ui_player_gas_MAX
	king_gas_bar.max_value = ui_king_gas_MAX
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_gas_bar.set_value(game_manager.player_gas)
	king_gas_bar.set_value(game_manager.king_gas)
	

