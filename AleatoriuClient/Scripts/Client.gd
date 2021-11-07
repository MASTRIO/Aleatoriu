extends Node2D

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("193.116.70.171", 6007)
	get_tree().network_peer = peer
	
	get_tree().connect("connected_to_server", self, "_connection_succeeded")
	get_tree().connect("connection_failed", self, "_connection_failed")

func _connection_succeeded():
	print("yahoo")

func _connection_failed():
	print("yaboo")
