extends Area2D



func _on_Coin_body_entered(body):
	
	if body.name == "Player":
		body.Coin += 1
		queue_free()
	
	pass # Replace with function body.
