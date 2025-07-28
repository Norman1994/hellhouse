extends Node2D

@export var next_scene : String
@export var need_key : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#			
func change_scene():
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")

func _on_animation_area_body_exited(body: Node2D) -> void:
	if body.name != "MainHero":
		return
	$OpenDoor.hide()

func _on_to_next_level_body_entered(body: Node2D) -> void:
	print_debug("ХУУУУУУУУУУУУУУЙ")
	if body.name != "MainHero":
		return
	if need_key: 
		if body.has_key:
			call_deferred("change_scene")

func _on_animation_area_body_entered(body: Node2D) -> void:
	if body.name != "MainHero":
		return
	
	if need_key: 
		print_debug("I'M HERE!!!!")
		if body.has_key:
			$OpenDoor.show()
			$DoorSound.play()
