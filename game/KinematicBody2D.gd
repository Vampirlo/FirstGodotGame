extends KinematicBody2D

var velocity = Vector2()
const Speed = 200
const Gravity = 10
const Jump = 200
const Floor = Vector2(0,-1)

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x = -Speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = Speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -Jump
	
	velocity.y += Gravity
	
	velocity = move_and_slide(velocity, Floor)

func animate():
	var anim = "idle"
	
	if $Sprite.animation != anim:
		$Sprite.play(anim)
