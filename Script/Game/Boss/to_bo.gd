extends CharacterBody2D
var NowNumberOfAttack = [0,1,2,3,4]
var State:int = NowNumberOfAttack[2]

@export var Health:float = 200
@export var RangeComp:RangeAttackers
@export var RangeComp2:RangeAttackers

@export var FireCooldown = 0.01
var CanFire = true
var CanLazer = false

@export var ManiPointToMove:Node2D

@export var Player:Node2D
func _ready():
	ChangePosition(ManiPointToMove.get_child(randi_range(0,ManiPointToMove.get_child_count() -1)).position)

func _physics_process(delta):
	match State:
		0:
			pass
		1:
			Attack_1()
		2:
			Attack_2()
		3:
			Attack_3()
		4:
			Attack_4()
	print(Health)
	if Health <= 0:
		Death()
	
	move_and_slide()

func Death():
	queue_free()

func Attack_1():
	if CanFire == true:
		RangeComp.Fire()
		CanFire = false
		await get_tree().create_timer(FireCooldown).timeout
		CanFire = true 
func Attack_2():
	if CanFire == true:
		RangeComp2.Fire()
		CanFire = false
		await get_tree().create_timer(1).timeout
		CanFire = true 
func Attack_3():
	pass
func Attack_4():
	pass

func ChangePosition(PoseToGo:Vector2):
	var dir = (position - PoseToGo).normalized() * -50
	velocity = dir

func Damaged(Damage:float):
	Health -= Damage

func ChangeAttack():
	ChangePosition(ManiPointToMove.get_child(randi_range(0,ManiPointToMove.get_child_count() -1)).position)
	await get_tree().create_timer(3).timeout
	State = randi_range(1,4)

func Trigger(Mode:int):
	if Mode == 1:
		CanLazer = true
	elif Mode == 2:
		CanLazer = false
