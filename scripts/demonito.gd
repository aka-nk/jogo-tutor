extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0


func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	print("Sprite: ", animated_sprite_2d)
	print("Animações: ", animated_sprite_2d.sprite_frames.get_animation_names())


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED

	if direction != Vector2.ZERO:
		animated_sprite_2d.play("walking")
		if direction.x != 0:
			animated_sprite_2d.flip_h = direction.x < 0
	else:
		animated_sprite_2d.play("idle")

	move_and_slide()
