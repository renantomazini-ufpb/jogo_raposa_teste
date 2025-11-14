extends Area2D
@export var speed = 100
var velocity = Vector2(speed,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("correndo")

func corre(delta: float):
	position += velocity * delta
	
func seta_velocidade(vel: int):
	velocity = Vector2(vel, 0)
	if vel < 0:
		$AnimatedSprite2D.flip_h = true
		print("eu rodo")
	elif vel > 0:
		print("eu tbm")
		$AnimatedSprite2D.flip_h = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	corre(delta)
	
