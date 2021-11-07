extends Node

# Server info
const PORT = 6007
const MAX_PLAYERS = 10

func _ready():
	# Creates the server
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	
	
	# Connect server events
	get_tree().connect("network_peer_connected", self, "_client_connected" )
	get_tree().connect("network_peer_disconnected", self, "_client_disconnected")

# When a client connects to the server
func _client_connected(id):
	print('Client ' + str(id) + ' connected to Server')
	
	# Add the remote client to the server
	var new_client = load("res://Scenes/RemoteClient.tscn").instance()
	new_client.set_name(str(id))     # spawn players with their respective names
	get_tree().get_root().add_child(new_client)

func _client_disconnected(id):
	print('Client ' + str(id) + ' disconnected from Server')
