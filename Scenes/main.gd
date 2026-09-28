extends Node2D


func _on_player_health_changed(new_health):
	$UI/HealthLabel.text = "Health: " + str(new_health)
	$UI/HealthBar.value = new_health


func _on_player_died():
	$UI/GameOverLabel.show()
	$UI/RestartButton.show()


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
