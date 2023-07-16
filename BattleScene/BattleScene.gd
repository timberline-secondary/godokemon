extends CanvasLayer

var pikmon = preload("res://Monsters/Pikmon.tscn")

func _ready():
	var mon = pikmon.instance()
	$Enemy.add_child(mon)
