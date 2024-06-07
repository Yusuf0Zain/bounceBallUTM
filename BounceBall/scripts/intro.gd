extends Node2D

var current_step = 0
var steps = []

func _ready():

	steps = [
		{"image": "", "text": "..."},
		{"image": "res://assets/sprites/cutscene.png", "text": "a phone suddenly appear in dark"},
		{"image": "res://assets/sprites/cutscene.png", "text": "you regonise it"},
		{"image": "res://assets/sprites/cutscene.png", "text": "its the same phone that your grandparents had it"},
		{"image": "res://assets/sprites/cutscene.png", "text": "you remembered the old times you lived"},
		{"image": "res://assets/sprites/cutscene.png", "text": "the screen, the notification ring, the ringtone"},
		{"image": "res://assets/sprites/cutscene.png", "text": "and most importantly, the games"},
		
		{"image": "res://assets/sprites/cutscene2.png", "text": "you picked the phone"},
		{"image": "res://assets/sprites/cutscene2.png", "text": "and the intro of nokia started playing"},
		{"image": "", "text": "..."},
	]
	
	show_step(current_step)
	
func show_step(step_index):
	var step = steps[step_index]
	$Sprite2D.texture = load(step["image"])
	$Label.text = step["text"]
	
func _input(event):
	if event.is_action_pressed("ui_accept"):  
		$AudioStreamPlayer.play()
		current_step += 1
		if current_step < steps.size():
			show_step(current_step)
		else:
			# End of intro, proceed to next scene or action
			get_tree().change_scene_to_file("res://scenes/nokiaMain.tscn")
