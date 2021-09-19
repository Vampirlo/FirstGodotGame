extends KinematicBody2D

var velocity = Vector2()

var Coin = 0;

var Health = 100;

const Speed = 200
const Gravity = 10
const Jump = 200
const Floor = Vector2(0,-1)

func get_input():
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene("res://Scenes/UI/Menu.tscn")

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

func ApplyDMG(dmg: int):
	Health -= dmg
	
	if Health <= 0:
		Health = 0
		get_tree().reload_current_scene()
