extends Area2D

func _on_body_entered(body):
	$deadTimer.start(3)
	$"../ball".get_node("CollisionShape2D").queue_free()
	$"../ball".handle_death()  
	$lose.play()
	$"../background2".stop()

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_spike_body_entered(body):
	$deadTimer.start(3)
	$"../ball".get_node("CollisionShape2D").queue_free()
	$"../ball".handle_death()  
	$lose.play()
	$"../background2".stop()


func _on_enemy_body_entered(body):
	$deadTimer.start(3)
	$"../ball".get_node("CollisionShape2D").queue_free()
	$"../ball".handle_death() 
	$lose.play()
	$"../background2".stop()

