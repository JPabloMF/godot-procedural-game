extends Node2D

export(String,FILE,"*.tscn") var next_world

func _ready():
	pass # Replace with function body.

func _on_WorldComplete_area_entered(area):
	if area.get_name() == "Player":
		get_tree().change_scene(next_world)
