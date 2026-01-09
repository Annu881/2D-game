extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY_ACCEL = 980.0

# Momentum variables
var gravity_direction = 1.0 # 1.0 for down, -1.0 for up
var is_flipping = false

@onready var sprite = $Sprite2D
@onready var coyote_timer = $CoyoteTimer

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += GRAVITY_ACCEL * gravity_direction * delta

	# Handle Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY * gravity_direction
		# Play jump sound (placeholder)

	# Handle Gravity Flip
	if Input.is_action_just_pressed("ui_focus_next"): # Tab or custom key
		flip_gravity()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Rotate sprite based on gravity
	if gravity_direction < 0:
		sprite.scale.y = -1
	else:
		sprite.scale.y = 1

	move_and_slide()

func flip_gravity():
	gravity_direction *= -1.0
	up_direction = Vector2(0, -gravity_direction)
	Global.is_gravity_down = (gravity_direction > 0)
	Global.gravity_flipped.emit(Global.is_gravity_down)
	
	# Optional: Add a small vertical boost or momentum preservation
	# velocity.y = 0 # Reset vertical velocity for easier control? 
	# Or keep momentum:
	velocity.y *= 0.5 # Dampen slightly
