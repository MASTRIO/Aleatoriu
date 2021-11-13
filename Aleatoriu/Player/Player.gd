extends KinematicBody2D

var speed = 75

var velocity = Vector2(0, 0)

func _physics_process(_delta):
	# Movement
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	var _result = move_and_slide(velocity)
	velocity = Vector2(0, 0)
	
	Global.tile_position = get_parent().get_node("Ground").world_to_map(position)
	
	#get_parent().get_node("Ground").set_cell(Global.tile_position[0], Global.tile_position[1], 1)
