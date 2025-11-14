extends Node2D
var comida = preload("res://comida.tscn")
var urso_ator = preload("res://urso.tscn")
var screen_size
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	criar_comida()
	criar_comida()
	criar_comida()	
	criar_urso()
	criar_urso()
	criar_urso()
	criar_urso()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func criar_comida():
	var comida_colocada = comida.instantiate()
	#botar animação aqui
	var x = rng.randf_range(0, screen_size.x)
	var y = rng.randf_range(0, screen_size.y)
	add_child(comida_colocada)
	comida_colocada.position = Vector2(x, y)
	comida_colocada.connect("coletado",Callable(self, "_on_comida_2d_coletado"))


func criar_urso():
	var x
	var urso = urso_ator.instantiate()
	var lado = rng.randi_range(0, 1)
	var y = rng.randf_range(100, 300)
	if lado == 1:
		x = 600
		urso.seta_velocidade(-100)
	else:
		x = -50
		urso.seta_velocidade(100)
	urso.position = Vector2(x,y)
	add_child(urso)
	
	
func _on_comida_2d_coletado() -> void:
	print("pontuou!")
	criar_comida()
	


func _on_comida_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_urso_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == "raposa":
		print("urso pegou!") # Replace with function body.
