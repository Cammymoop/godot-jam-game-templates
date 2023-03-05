extends Node2D

var spawn_timer: float = 0

@export var MAX_BUB: int = 1300

@export var spawn_wait: = 0.8 
@export var wait_multiplier = 0.995

var bubble_scn = preload("res://scenes/bubble.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bub_count = get_child_count()
	if bub_count >= MAX_BUB:
		return
	
	spawn_timer += delta
	if spawn_timer >= spawn_wait:
		spawn_timer = 0.0
		spawn_wait *= wait_multiplier
		
		var screen_size = get_viewport_rect().size
		
		var new_bub: Node2D = bubble_scn.instantiate()
		add_child(new_bub)
		new_bub.global_position = Vector2(randf() * screen_size.x, randf() * screen_size.y)
