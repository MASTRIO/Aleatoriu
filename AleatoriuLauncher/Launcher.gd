extends Node2D

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_LaunchGame_pressed():
	$AnimationPlayer.play("LoadGame")

func _on_ProgressBar_value_changed(value):
	if value == 100:
		yield(get_tree().create_timer(0.2), "timeout")
		OS.set_window_title("WOOSH!")
		$AnimationPlayer.play("LaunchGame")
		yield(get_tree().create_timer(0.2), "timeout")
		$Camera.zoom = Vector2(1, 1)
		$Loading.show()
		$CanvasModulate.color = Color(1, 1, 1)
		$Loading/AnimationPlayer.play("loading_lol")
