extends KinematicBody2D

var player_in_platform = false
var current_floor = 1

func _ready():
	pass # Replace with function body.
	
func handle_platform_movement():
	if current_floor == 1 and $AnimationPlayer.is_playing() == false:
		if Input.is_action_just_pressed("ui_down") and player_in_platform:
				$AnimationPlayer.play("1-2")
				current_floor = 2
				
	if current_floor == 2 and $AnimationPlayer.is_playing() == false:
		if Input.is_action_just_pressed("ui_down") and player_in_platform:
				$AnimationPlayer.play("2-3")
				current_floor = 3
	
	if current_floor == 2 and $AnimationPlayer.is_playing() == false:
		if Input.is_action_just_pressed("ui_up") and player_in_platform:
				$AnimationPlayer.play("2-1")
				current_floor = 1
				
	if current_floor == 3 and $AnimationPlayer.is_playing() == false:
		if Input.is_action_just_pressed("ui_up") and player_in_platform:
				$AnimationPlayer.play("3-2")
				current_floor = 2
	if current_floor == 3 and $AnimationPlayer.is_playing() == false:
		if Input.is_action_just_pressed("ui_down") and player_in_platform:
				print('generate world')

func _physics_process(delta):
	handle_platform_movement()

func _on_Platform_area_entered(area):
	if "Player" in area.get_name():
		player_in_platform = true
		
func _on_Platform_area_exited(area):
	if "Player" in area.get_name():
		player_in_platform = false
