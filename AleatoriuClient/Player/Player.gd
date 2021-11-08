extends KinematicBody2D

var speed = 200

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
	move_and_slide(velocity)
	velocity = Vector2(0, 0)
