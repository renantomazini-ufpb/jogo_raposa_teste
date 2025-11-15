extends Area2D
signal coletado

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x = randi_range(0,1)
	var y = randi_range(0,1)
	$Sprite2D.frame_coords = Vector2(x,y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "raposa":
		#print("aqui")
		emit_signal("coletado")
		queue_free()
	print("entrou")
	


func _on_area_entered(area: Area2D) -> void:
	if area.name == "raposa":
		#print("aqui")
		emit_signal("coletado")
		queue_free()
