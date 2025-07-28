extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/first_floor.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
