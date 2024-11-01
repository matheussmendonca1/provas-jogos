extends CharacterBody2D

var SPEED = 50.0
var direction = -1
@onready var animacao = $Animacao as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.

	if direction:
		velocity.x = direction * SPEED

	if $InverteDirecao.is_colliding():
		direction *= -1
		self.scale.x *= -1
	
	move_and_slide()


func _on_animacao_animation_finished() -> void:
	queue_free();
