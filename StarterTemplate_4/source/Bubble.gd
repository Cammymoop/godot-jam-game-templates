extends Sprite2D

var pitch_min: = 0.8
var pitch_max: = 1.3

var appear_duration: = 0.4
var dissapear_duration: = 0.2

var hittable: = false

func _ready():
	scale = Vector2(0.1, 0.1)
	var tw: = create_tween()
	tw.tween_property(self, "scale", Vector2(5, 5), appear_duration)
	tw.tween_callback(on_appeared)
	
	$POP.pitch_scale = randf_range(pitch_min, pitch_max)

func on_appeared() -> void:
	hittable = true
	$Area2D.monitoring = true

func on_hit(_area) -> void:
	if hittable == false:
		return
	
	hittable = false
	$Area2D.set_deferred("monitoring", false)
	$POP.play()
	
	var tw = create_tween()
	tw.tween_property(self, "scale", Vector2(6.5, 6.5), dissapear_duration)
	tw.parallel().tween_property(self, "self_modulate:a", 0, dissapear_duration)
	tw.tween_callback(queue_free)
