extends Area2D

const SPEED = 300
var direction = 1

func _process(delta):
	if $CollisionShape2D/RayCastLeft.is_colliding():
		direction = 1
	if $CollisionShape2D/RayCastRight.is_colliding():
		direction = -1
	position.x += direction * SPEED * delta
