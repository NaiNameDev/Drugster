extends "res://Script/Game/Comps/RangeFireComp.gd"

@export var Player:Node2D
var TmpSnarad:RigidBody2D
@export var RandomizeAngel:int = 50

func SetDir():
	var TMPRandomizeAngel = randi_range(-RandomizeAngel,RandomizeAngel)
	dir = (global_position - Player.global_position).normalized() *-Speed + Vector2(TMPRandomizeAngel,TMPRandomizeAngel)
	return dir

func Fire():
	TmpSnarad = Snarad.instantiate()
	TmpSnarad.Damage = Damage
	get_parent().get_parent().add_child(TmpSnarad)
	TmpSnarad.position = global_position
	TmpSnarad.look_at(Player.global_position)
	TmpSnarad.linear_velocity = SetDir()
