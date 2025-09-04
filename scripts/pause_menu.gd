extends Control

func _ready():
	visible = false
	get_tree().paused = false
	
func resume():
	get_tree().paused = false
	print_debug(get_tree().paused)
	visible = false
	
func pause():
	visible = true
	get_tree().paused = true
	print_debug("Тут ", get_tree().paused)
	
	
func testEsc():
	if Input.is_action_just_pressed("exit") and visible == false:
		pause()
	elif Input.is_action_just_pressed("exit") and visible == true:	
		resume()
		
func _process(delta):
	testEsc()

func _on_resume_pressed() -> void:
	resume()

func _on_load_pressed() -> void:
	pass # Replace with function body.
	
func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")
