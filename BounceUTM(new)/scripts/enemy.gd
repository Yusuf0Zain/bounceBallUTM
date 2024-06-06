extends Node2D
const SPEED = 200

var direction = -1

func _process(delta):
	if $RayCastL.is_colliding():
		direction = 1
	if $RayCastR.is_colliding():
		direction = -1

	position.x += direction * SPEED * delta


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
