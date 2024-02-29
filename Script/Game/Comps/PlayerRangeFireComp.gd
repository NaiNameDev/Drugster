extends "res://Script/Game/Comps/RangeFireComp.gd"

var TmpSnarad:RigidBody2D

func SetDir():
	dir = (global_position - get_global_mouse_position()).normalized() * -Speed
	return dir

func Fire():
	TmpSnarad = Snarad.instantiate()
	TmpSnarad.Damage = Damage 
	get_parent().get_parent().add_child(TmpSnarad)
	TmpSnarad.position = get_parent().position
	TmpSnarad.look_at(get_global_mouse_position())
	TmpSnarad.linear_velocity = SetDir()
