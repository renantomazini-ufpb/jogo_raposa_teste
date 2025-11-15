extends Area2D
@export var speed = 100
signal game_over


var velocity = Vector2(speed,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("correndo")

func corre(delta: float):
	#var sorte = randi_range(0,1000)
	'''print(sorte)''' #um dia
	position += velocity * delta
	'''if sorte > 800:
		if position.y > 150:
			velocity = Vector2(speed,-100)
		if position.y <= 150:
			print("baixo!")
			velocity = Vector2(speed,100)'''
	
func seta_velocidade(vel: int):
	velocity = Vector2(vel, 0)
	if vel < 0:
		$AnimatedSprite2D.flip_h = true
		#print("eu rodo")
	elif vel > 0:
		#print("eu tbm")
		$AnimatedSprite2D.flip_h = false


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	corre(delta)
	if self.position.x > 600:
		queue_free()
	if self.position.x < -100:
		queue_free()
	


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
		if area.name == "raposa":
			emit_signal("game_over") # Replace with function body.
