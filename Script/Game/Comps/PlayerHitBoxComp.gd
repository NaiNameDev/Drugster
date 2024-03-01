extends "res://Script/Game/Comps/HitBoxComp.gd"

var Player:Node2D

func _ready():
	Player = get_parent()

func Damaged(Damage:float):
	Player.Health -= Damage
