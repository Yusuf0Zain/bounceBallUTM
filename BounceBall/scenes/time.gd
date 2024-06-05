extends Label

@onready var Label = $Label

func _ready():
	var time = Time.get_time_dict_from_system()
	Label.text = "%02d:%02d:%02d" % [time.hour, time.minute, time.second]
