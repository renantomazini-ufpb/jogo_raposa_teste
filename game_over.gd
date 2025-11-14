extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$RichTextLabel.text = "Fim de jogo!
pontuação:
"+ str(Global.pontos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_jogo_enviar_pontos(valor):
	$RichTextLabel.text = str(valor)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cena.tscn")
