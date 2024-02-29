extends CharacterBody2D
enum{
	Fight,
	RealWorld
}
var State = Fight

var Speed:int = 170
var JumpForce:int = -200
var FlyForce:int = -20
@export var FlyTime:float = 10
var DefFlyTime:float

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	DefFlyTime = FlyTime

func _physics_process(delta):
	match State:
		Fight:
			Move(1)
			Fly()
		RealWorld:
			Move(2)
	
	if not is_on_floor() and velocity.y <= 200:
		velocity.y += gravity * delta
	elif is_on_floor():
		FlyTime = DefFlyTime
	move_and_slide()

func Move(Mode:int):
	if Input.is_action_pressed("ui_accept") and is_on_floor() and Mode == 1:
		velocity.y = JumpForce

	var direction = Input.get_axis("Left", "Right")
	var RightDir = direction * Speed / Mode
	if direction > 0:
		if velocity.x < RightDir:               #wtf 0_0
			velocity.x += RightDir / 10
		elif velocity.x >= RightDir:
			velocity.x = RightDir
	elif direction < 0:
		if velocity.x > RightDir:
			velocity.x += RightDir / 10
		elif velocity.x >= RightDir:
			velocity.x = RightDir
	else:
		if velocity.x > 0:
			velocity.x -= 15
			if velocity.x <= 0:
				velocity.x = 0
		if velocity.x < 0:
			velocity.x += 15
			if velocity.x >= 0:
				velocity.x = 0

func Fly():
	if Input.is_action_pressed("ui_accept") and not is_on_floor() and velocity.y >= -200 and FlyTime > 0:
		if velocity.y < 0:
			velocity.y += FlyForce
			FlyTime -= 0.1
		else:
			velocity.y += FlyForce * 4
			FlyTime -= 0.1
