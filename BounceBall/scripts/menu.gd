extends Node2D



func _process(delta):
	pass


func _on_setting_pressed():
	pass


func _on_game_pressed():
	get_tree().change_scene_to_file("res://scenes/GameMenu.tscn")


func _on_power_pressed():
	get_tree().quit()


func _on_video_stream_player_finished():
	$VideoStreamPlayer.queue_free()
