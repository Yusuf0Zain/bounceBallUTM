extends Area2D



func _on_body_entered(body):
	$"../..".addPoint()
	queue_free()

