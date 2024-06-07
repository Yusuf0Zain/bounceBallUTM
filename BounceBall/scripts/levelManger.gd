extends Node2D

var score = 0

func addPoint():
	score += 1
	$ball/Camera2D/score.text = str(score) + "/10"


func _on_bounce_body_entered(body):
	$bounce/AnimatedSprite2D.play("bounce")
	$ball.velocity.y = $ball.JUMP_VELOCITY * 1.5




func _on_tree_body_entered(body):
	$ball/AnimatedSprite2D.play("win")
	$Timer.start(4)
	$win.play()
	$background2.stop()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")

func _on_key_body_entered(body):
	$"Key,Lock/key".queue_free()
	$"Key,Lock/lock".queue_free()

