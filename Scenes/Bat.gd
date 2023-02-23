extends KinematicBody2D

var knockback = Vector2.ZERO

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 400 * delta)
	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area:Area2D):
	knockback = area.knockback_vector * 160