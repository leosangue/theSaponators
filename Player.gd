extends CharacterBody2D

var playerHP = 10
const SPEED = 450.0
var positionplayer = self.position
var rotation_speed = 1.5


# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	# Add the gravity.rotation_direction = Input.get_axis("left", "right")
	
	# Handle jump.
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
