extends "res://Scene/Tests/test_player_snarad.gd"

var Player:Node2D

func _ready():
	Player = get_parent().find_child("Player")
	await get_tree().create_timer(20).timeout
	queue_free()

func _physics_process(delta):
	FindWay()

func FindWay():
	var dir = (Player.global_position - global_position).normalized() * 100
	linear_velocity = dir
	look_at(Player.position)
