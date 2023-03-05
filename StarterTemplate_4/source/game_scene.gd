extends Node2D

func _ready():
	randomize()


func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
