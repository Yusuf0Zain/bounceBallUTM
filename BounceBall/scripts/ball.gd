extends CharacterBody2D

const MAX_SPEED = 400.0
const MIN_SPEED = 50.0
const ACCELERATION_TIME = 2.0
const JUMP_VELOCITY = -400.0
const FIRST_BOUNCE_VELOCITY = -200.0
const SECOND_BOUNCE_VELOCITY = -60.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_speed = MIN_SPEED
var acceleration = (MAX_SPEED - MIN_SPEED) / ACCELERATION_TIME
var was_on_floor = false  # Tracks whether the ball was on the floor in the previous frame
var bounce_count = 0  # Counts the number of bounces

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		bounce_count = 0  # Reset bounce count when jumping

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		current_speed = min(current_speed + acceleration * delta, MAX_SPEED)
		velocity.x = direction * current_speed
	else:
		current_speed = MIN_SPEED
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)

	# Apply bounce effect when landing
	if not was_on_floor and is_on_floor():
		if bounce_count == 0:
			velocity.y = FIRST_BOUNCE_VELOCITY
			bounce_count += 1
		elif bounce_count == 1:
			velocity.y = SECOND_BOUNCE_VELOCITY
			bounce_count += 1

	was_on_floor = is_on_floor()

	move_and_slide()
