extends Area2D

@onready var counter = $"../.."


func _on_body_entered(body):
	counter.addPoint()
	queue_free()
