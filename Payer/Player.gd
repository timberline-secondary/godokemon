extends KinematicBody2D

const SPEED := 100.0
onready var anim = $AnimationTree

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0)
	var velocity = Vector2.ZERO
	if input_dir:
		velocity = input_dir * SPEED
		anim.get("parameters/playback").travel("Walk")
		anim.set("parameters/Idle/blend_position", input_dir)
		anim.set("parameters/Walk/blend_position", input_dir)
		
	else:
		anim.get("parameters/playback").travel("Idle")
		velocity.x = move_toward(velocity.x, 0, 20)
		velocity.y = move_toward(velocity.y, 0, 20)
	
	move_and_slide(velocity)

func play_idle():
	anim.get("parameters/playback").travel("Idle")
