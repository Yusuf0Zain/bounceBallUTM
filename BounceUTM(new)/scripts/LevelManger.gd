extends Node2D
@onready var animated_sprite = $ball/AnimatedSprite2D
var score = 0

func addPoint():
	score += 1
	$ball/Camera2D/score.text = str(score) + "/10"

func _on_tree_body_entered(body):
	animated_sprite.play("win")
	$ball.current_speed = $ball.current_speed * 0
	%Timer.start(5)

func _on_bounce_body_entered(body):
	$bounce/AnimatedSprite2D.play("bounce")


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://level0.tscn")


func _on_death_zone_body_entered(body):
	animated_sprite.play("dead")
	$ball.velocity.y = -500


func _on_key_body_entered(body):
	%lock.queue_free()
	%key.queue_free()


func _on_enemy_death_body_entered(body):
	animated_sprite.play("dead")





func _on_spike_body_entered(body):
	animated_sprite.play("dead")


