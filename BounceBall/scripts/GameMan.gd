extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/LevelTest.tscn")
func _on_levels_pressed():
	$Lgoo.hide()
	$Levels.show()
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/nokiaMain.tscn")




func _on_one_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


func _on_two_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_three_pressed():
	get_tree().change_scene_to_file("res://scenes/Level3.tscn")

func _on_boss_pressed():
	get_tree().change_scene_to_file("res://scenes/BossLevel.tscn")

func _on_secret_pressed():
	get_tree().change_scene_to_file("res://scenes/Secret.tscn")


func _on_back_menu_pressed():
	$Lgoo.show()
	$Levels.hide()
