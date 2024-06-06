extends CharacterBody2D

const MAX_SPEED = 200.0
const MIN_SPEED = 50.0
const ACCELERATION_TIME = 2.0
const JUMP_VELOCITY = -500.0
const FIRST_BOUNCE_VELOCITY = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_speed = MIN_SPEED
var acceleration = (MAX_SPEED - MIN_SPEED) / ACCELERATION_TIME
var was_on_floor = false
var idle_time = 0.0
var IDLE_THRESHOLD = 2.5
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer



enum AnimationState { IDLE, RUN, JUMP, FALL, WAIT, FLOOR, DEAD, WIN }
var current_animation_state = AnimationState.IDLE

	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		set_animation_state(AnimationState.FALL)
	else:
		set_animation_state(AnimationState.IDLE)
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		set_animation_state(AnimationState.JUMP)

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		current_speed = min(current_speed + acceleration * delta, MAX_SPEED)
		velocity.x = direction * current_speed
		idle_time = 0.0
		if current_animation_state != AnimationState.JUMP:
			set_animation_state(AnimationState.RUN)
	else:
		current_speed = MIN_SPEED
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)
		if is_on_floor() and velocity.x == 0:
			idle_time += delta
			if idle_time >= IDLE_THRESHOLD:
				animated_sprite.play("wait")
			elif current_animation_state != AnimationState.WAIT:
				set_animation_state(AnimationState.IDLE)

	if not was_on_floor and is_on_floor():
		set_animation_state(AnimationState.FLOOR)
		idle_time = 0.0
	was_on_floor = is_on_floor()

	move_and_slide()

func set_animation_state(state):
	if state != current_animation_state:
		current_animation_state = state
		match state:
			AnimationState.IDLE:
				animated_sprite.play("idle")
			AnimationState.RUN:
				animated_sprite.play("run")
			AnimationState.JUMP:
				animated_sprite.play("jump")
			AnimationState.FALL:
				animated_sprite.play("fall")
			AnimationState.WAIT:
				animated_sprite.play("wait")
			AnimationState.FLOOR:
				animated_sprite.play("floor")

func _on_AnimatedSprite2D_animation_finished():
	if current_animation_state == AnimationState.FLOOR:
		set_animation_state(AnimationState.IDLE)

func _on_spike_area_body_entered(body):
	current_speed = 0
	animated_sprite.play("dead")
	if animated_sprite.animation != "dead":
		get_tree().reload_current_scene()




func _on_bounce_body_entered(body):
	velocity.y = JUMP_VELOCITY * 1.5
