extends Control



func _ready():
	pass # Replace with function body.

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/GameLevels/Node2D.tscn")


func _on_OptionsButton_pressed():
	var options = load("").instance()
	get_tree().current_scene.add_child(options)


func _on_QuitButton_pressed():
	get_tree().quit()
