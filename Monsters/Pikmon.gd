extends StaticBody2D


var health = 20
var level = 1

func _ready():
	level = randi() % 5 + 1
	spawn()
	
func spawn():
	print("spawning!")
	$AnimationPlayer.play("Spawn", -1, 1)

func capture():
	$AnimationPlayer.play("Capture", -1, 3)
	yield($AnimationPlayer, "animation_finished")

func _on_attach_animation_finisheddddd():
	pass
	

