extends Area2D


func _on_Spike_body_exited(body):
	if body.name == "Player":
		body.ApplyDMG(100)
	pass # Replace with function body.
