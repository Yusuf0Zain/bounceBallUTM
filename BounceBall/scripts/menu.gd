extends Node2D





func _on_game_pressed():
	get_tree().change_scene_to_file("res://scenes/GameMenu.tscn")
	$AudioStreamPlayer.play()

func _on_power_pressed():
	get_tree().quit()
	$AudioStreamPlayer.play()

func _on_video_stream_player_finished():
	$VideoStreamPlayer.queue_free()
