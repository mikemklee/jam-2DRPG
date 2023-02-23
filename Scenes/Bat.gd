extends KinematicBody2D

var knockback = Vector2.ZERO

onready var stats = $Stats

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 400 * delta)
	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area:Area2D):
	stats.health -= 1
	knockback = area.knockback_vector * 160

func _on_Stats_no_health():
	queue_free()
