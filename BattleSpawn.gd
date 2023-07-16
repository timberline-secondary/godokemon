extends Area2D

var battle = preload("res://BattleScene/BattleScene.tscn")

func _on_BattleSpawn_body_entered(body):
	if "Player" in body.name:
		var battleTmp = battle.instance()
		$"../UI/AnimationPlayer".play("TransIn")
		$"../Player".play_idle()
		get_tree().paused
		yield(get_tree().create_timer(1.0), "timeout")
		get_parent().add_child(battleTmp)
		queue_free()
		$"../UI/AnimationPlayer".play("TransOut")
