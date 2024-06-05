extends Label

@onready var label = $Label

func _ready():
	var time = Time.get_time_dict_from_system()
	label.text = "%02d:%02d:%02d" % [time.hour, time.minute, time.second]
