extends Label


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0

func _process(delta)->void:
	time += delta
	seconds = fmod(time, 60) 
	minutes = fmod(time, 3600) /60
	$".".text = "%02d: " % minutes + "%02d." %seconds
