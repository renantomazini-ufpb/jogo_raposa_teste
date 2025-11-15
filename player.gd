extends Area2D


@export var speed = 100
var screen_size
signal pontua
var game_over = false

func morrer():
	game_over = true
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play("desmaio")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	



func _process(delta):
	if game_over:
		return  
	var velocity = Vector2()
	if Input.is_action_pressed("baixo_"):
		velocity.y += 1	
		$AnimatedSprite2D.animation = "andar"
	if Input.is_action_pressed("cima_"):
		velocity.y -= 1	
		$AnimatedSprite2D.animation = "andar"
	if Input.is_action_pressed("esquerda_"):
		$AnimatedSprite2D.flip_h = true
		velocity.x -= 1	
		$AnimatedSprite2D.animation = "andar"
	if Input.is_action_pressed("direita_"):
		$AnimatedSprite2D.flip_h = false
		velocity.x += 1	
		$AnimatedSprite2D.animation = "andar"
	if Input.is_action_pressed("grito"):
		$AnimatedSprite2D.animation = "grito"
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.play()
	position += velocity * delta
	
	position.y = clamp(position.y,-20, screen_size.y -40)
	position.x = clamp(position.x,0, screen_size.x)

	

	


#func _on_body_entered(body: Node2D) -> void:
#	if body.name == "comida":
#		emit_signal("pontua")
#	else:
#		$AudioStreamPlayer2D.play()
#	position.x = 603
#	position.y = 690
