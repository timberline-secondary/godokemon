extends StaticBody2D


var health = 20
var level = 1

func _ready():
	level = randi() % 5 + 1
	spawn()
	$Aim/Attack.hide()
	
func hit(anim, damage):
	health = damage
	$Aim/Attack.show()
	$Aim/Attack.play(anim)
	
func spawn():
	print("spawning!")
	$AnimationPlayer.play("Spawn", -1, 1)

func capture():
	$AnimationPlayer.play("Capture", -1, 3)
	yield($AnimationPlayer, "animation_finished")
	get_parent().get_parent()._on_flee_pressed()

func _on_Attack_animation_finished():
	$Aim/Attack.hide()
