extends Node2D

func _ready():
	$Shadow.show()
	Server._connect_to_server()

remote func wario(thing, amount):
	rpc("lmao", get_tree().get_network_unique_id())
	get_node("/root/Client/GUI/ColorRect/Label").text = thing + " x" + str(amount)
