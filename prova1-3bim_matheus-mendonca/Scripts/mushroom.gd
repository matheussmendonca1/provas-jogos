extends CharacterBody2D

var SPEED = 10.0
const JUMP_VELOCITY = -400.0
var direction = -1
@onready var animacao = $Animacao as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction:
		velocity.x = direction * SPEED

	if $InverteDirecao.is_colliding():
		direction *= -1
		self.scale.x *= -1
	
	if $AumentaVelocidade.is_colliding():
		SPEED = 100
	else:
		SPEED = 10
	
	move_and_slide()


func _on_animacao_animation_finished() -> void:
	queue_free();
