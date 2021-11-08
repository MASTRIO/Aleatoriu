extends Node

#var new_client = load("res://Scenes/RemoteClient.tscn").instance()
#new_client.set_name(str(id))
#new_client.id = id
#new_client.player_position = Vector2(0, 0)
#$".".add_child(new_client)

#$".".get_node(str(id)).queue_free()

# Server info
const PORT = 6007
const MAX_PLAYERS = 10

var network = NetworkedMultiplayerENet.new()
var selected_IP
var selected_port

var local_player_id = 0
sync var players = {}
sync var player_data = {}

func _ready():
	
