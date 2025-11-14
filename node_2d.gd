extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D2.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Iniciado")
	get_tree().change_scene_to_file("res://cena.tscn")


func _on_button_2_pressed() -> void:
	$Aviso.visible = !$Aviso.visible
