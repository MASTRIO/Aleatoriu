extends Node2D

func _ready():
	$WorldEffects.play("ResetEffects")
	yield(get_tree().create_timer(2), "timeout")
	day_night_cycle()

func day_night_cycle():
	$WorldEffects.play("NightTransition")
	yield(get_tree().create_timer(10), "timeout")
	$WorldEffects.play("DayTransition")
	yield(get_tree().create_timer(10), "timeout")
	day_night_cycle()
