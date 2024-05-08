extends Area2D
var speed = 5
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var direction = (Vector2(1000,500) - global_position).normalized()
	velocity = direction*speed
	global_rotation = direction.angle() + PI / 2.0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity)


func _on_body_entered(body):
	if body.name=="Player":
		Game.playerHP-=1
		
