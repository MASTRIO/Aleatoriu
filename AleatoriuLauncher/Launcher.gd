extends Node2D

var current_verion = "0.1.0"
var new_version = ""
var update_status = "checking"

func _ready():
	$LaunchGame.disabled = true
	$LaunchGame/Label.text = "checking for updates"
	$LaunchGame/Label.add_color_override("font_color", Color(0.5, 0.5, 0.5))
	$GetVersion.request("https://run.mocky.io/v3/6a392ba1-b01d-4634-86b2-f715badb8d62")

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_LaunchGame_pressed():
	if update_status == "ready":
		$AnimationPlayer.play("LoadGame")
	else:
		current_verion = new_version
		$LaunchGame.text = "Launch"
		$LaunchGame/Label.text = "Latest release v" + current_verion
		update_status = "ready"

func _on_ProgressBar_value_changed(value):
	if value == 100:
		yield(get_tree().create_timer(0.2), "timeout")
		OS.set_window_title("WOOSH!")
		$AnimationPlayer.play("LaunchGame")
		$Camera.zoom = Vector2(1, 1)
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().quit()

func _on_GetVersion_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var latest_version = json.result["client_version"]
	if latest_version != current_verion:
		$LaunchGame.text = "Update"
		$LaunchGame/Label.text = "to latest version v" + latest_version
		update_status = "needs_update"
		new_version = latest_version
	else:
		$LaunchGame.text = "Launch"
		$LaunchGame/Label.text = "Latest release v" + current_verion
		update_status = "ready"
	$LaunchGame.disabled = false
	$LaunchGame/Label.add_color_override("font_color", Color(1, 1, 1))
