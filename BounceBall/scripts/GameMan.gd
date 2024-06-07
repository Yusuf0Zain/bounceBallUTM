extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	$AudioStreamPlayer.play()
func _on_levels_pressed():
	$AudioStreamPlayer.play()
	$Lgoo.hide()
	$Levels.show()
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/nokiaMain.tscn")
	$AudioStreamPlayer.play()



func _on_one_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	$AudioStreamPlayer.play()


func _on_two_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	$AudioStreamPlayer.play()


func _on_three_pressed():
	get_tree().change_scene_to_file("res://scenes/Level3.tscn")
	$AudioStreamPlayer.play()



func _on_back_menu_pressed():
	$AudioStreamPlayer.play()
	$Lgoo.show()
	$Levels.hide()
