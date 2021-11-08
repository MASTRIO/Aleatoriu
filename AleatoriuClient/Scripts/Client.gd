extends Node2D

func _ready():
	$Shadow.show()
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(IP.get_local_addresses()[3], 6007)
	get_tree().network_peer = peer

func _physics_process(_delta):
	rpc("update_player_position", $Player.position)

remote func connection_status():
	print("yahahah, it works")
