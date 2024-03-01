extends Area2D

func _on_body_entered(body):
	body.Trigger(1)

func _on_body_exited(body):
	body.Trigger(2)
