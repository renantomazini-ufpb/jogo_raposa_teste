extends Node2D
var comida = preload("res://comida.tscn")
var urso_ator = preload("res://urso.tscn")
var screen_size
var rng = RandomNumberGenerator.new()
var pontuacao = 0
var cont_clico = 0
var vel_urso = 45
signal enviar_pontos(pontos) #metodo antigo
var ja_morreu = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	criar_comida()
	criar_comida()
	criar_comida()
	criar_comida()
	criar_urso()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$pontos.text = "Pontos:" + str(pontuacao)

func criar_comida():
	var comida_colocada = comida.instantiate()
	#botar animação aqui
	var x = rng.randf_range(0, screen_size.x)
	var y = rng.randf_range(0, screen_size.y)
	add_child(comida_colocada)
	comida_colocada.position = Vector2(x, y)
	comida_colocada.connect("coletado",Callable(self, "_on_comida_2d_coletado"))

func over():
	if ja_morreu:
		return
	ja_morreu = true
	var raposa = $raposa
	Global.pontos = pontuacao
	print("play? Game over")
	raposa.morrer()
	await raposa.get_node("AnimatedSprite2D").animation_finished
	emit_signal("enviar_pontos", pontuacao)
	get_tree().change_scene_to_file("res://gameover.tscn")
	

func criar_urso():
	var x
	var urso = urso_ator.instantiate()
	urso.connect("game_over", over)
	var lado = rng.randi_range(0, 1)
	var y = rng.randf_range(100, 300)
	if lado == 1:
		x = 600
		urso.seta_velocidade(vel_urso * -1)
	else:
		x = -50
		urso.seta_velocidade(vel_urso)
	urso.position = Vector2(x,y)
	add_child(urso)
	
	
func _on_comida_2d_coletado() -> void:
	print("pontuou!")
	pontuacao += 1 
	print(pontuacao)
	criar_comida()
	


func _on_comida_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_urso_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass




func _on_timer_timeout() -> void:
	cont_clico += 1 
	for n in cont_clico:
		criar_urso()
	if cont_clico == 5:
		cont_clico = 0
		vel_urso += pontuacao * 3
		


func _on_enviar_pontos(pontos: Variant) -> void:
	pass # Replace with function body.
