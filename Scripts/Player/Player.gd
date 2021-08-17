extends KinematicBody2D

var motion = Vector2()
var gravity = 30
var tilemap
var player_in_platform = false

func _ready():
	focus_home_camera()

func _physics_process(delta):
	motion.y += gravity
	handle_horizontal_movement()
	
	motion = move_and_slide(motion,Vector2.UP,true,4,PI/4,false)

func focus_home_camera():
	var context = get_tree().get_current_scene().get_name()
	if context == "Home":
		$Camera2D.current = false
	else:
		$Camera2D.current = true

func handle_horizontal_movement():
	if Input.is_action_pressed("ui_left") and is_platform_moving() == false:
		motion.x = -150
		$AnimatedPlayer.play("run")
		$AnimatedPlayer.flip_h = true
	elif Input.is_action_pressed("ui_right") and is_platform_moving() == false:
		motion.x = 150
		$AnimatedPlayer.play("run")
		$AnimatedPlayer.flip_h = false
	else:
		motion.x = 0
		$AnimatedPlayer.play("idle")

func is_platform_moving():
	return get_parent().get_node("platform").get_node("AnimationPlayer").is_playing()

func _on_Player_area_entered(area):
	if "Platform" in area.get_name():
		player_in_platform = true

func _on_Player_area_exited(area):
	if "Platform" in area.get_name():
		player_in_platform = false
