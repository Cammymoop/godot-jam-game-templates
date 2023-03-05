extends Sprite2D

@export var reverse: bool = false
@export var spin_speed: float = 2.5

func _process(delta):
	rotation += delta * spin_speed * (-1 if reverse else 1)
