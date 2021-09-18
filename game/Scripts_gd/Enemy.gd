extends KinematicBody2D

var velocity = Vector2()
var direction = 1
const Gravity = 10
const Speed = 30
const Floor = Vector2(0, -1)

func _ready():
	$anim.play("walk")

func _process(delta):
	velocity.x  = direction * Speed
	if not $RayCast2D.is_colliding():
		direction *= -1;
		$RayCast2D.position.x *= -1;
		$anim.flip_h = bool(1 - direction)
	velocity.y += Gravity
	
	velocity = move_and_slide(velocity, Floor)
