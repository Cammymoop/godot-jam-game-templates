extends Node2D

@export var move_speed = 460

func _process(delta):
	var scrn_size = get_viewport_rect().size
	
	position.x += Input.get_axis("go_left", "go_right") * move_speed * delta
	position.x = clampf(position.x, -14, scrn_size.x + 14)
	
	position.y += Input.get_axis("go_up", "go_down") * move_speed * delta
	position.y = clampf(position.y, -14, scrn_size.y + 14)
