extends KinematicBody2D

const EnemyDeathEffect = preload("res://Scenes/EnemyDeathEffect.tscn")

var knockback = Vector2.ZERO

onready var stats = $Stats

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 400 * delta)
	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area:Area2D):
	stats.health -= area.damage
	knockback = area.knockback_vector * 160

func _on_Stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
