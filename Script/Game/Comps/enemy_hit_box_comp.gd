extends "res://Script/Game/Comps/HitBoxComp.gd"

var Enemy:Node2D

func _ready():
	Enemy = get_parent()

func Damaged(Damage:float):
	Enemy.Health -= Damage
