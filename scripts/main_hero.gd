extends CharacterBody2D


@onready var step_sound: AudioStreamPlayer2D = $StepSound
var step_timer := 0.0
const STEP_INTERVAL := 0.4  # шаг каждые 0.4 сек при движении
var has_key : bool = false
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D;

func _ready() -> void:
	anim.play("Idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var horizontal_direction := Input.get_axis("ui_left", "ui_right")
	var vertical_direction := Input.get_axis("ui_up", "ui_down")
	
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if vertical_direction:
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if velocity.length() > 10:
		if not step_sound.playing:
			step_sound.play()
	else:
		if step_sound.playing:
			step_sound.stop()
		
	update_animation()
	move_and_slide()
	
func update_animation()-> void:
	if velocity.x < 0:
		anim.flip_h = true
	elif velocity.x > 0:
		anim.flip_h = false
			
	if velocity.x or velocity.y:
		anim.play("Run")
	else:
		anim.play("Idle")


func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.has_method("on_pickup"):
		area.on_pickup(self)
