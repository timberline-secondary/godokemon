extends CanvasLayer

var pinkMon = preload("res://Monsters/Pinkmon.tscn")

func _ready():
	var monTemp = pinkMon.instance()
	$Enemy.add_child(monTemp)
