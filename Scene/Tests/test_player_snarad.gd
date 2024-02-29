extends RigidBody2D

var Damage:int

func _ready():
	await get_tree().create_timer(5).timeout
	queue_free()

func _on_area_2d_body_entered(body):
	body.Damaged(Damage)
	queue_free()
