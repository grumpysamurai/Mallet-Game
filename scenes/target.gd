extends CharacterBody2D

var screensize
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var timer = $Timer

func _physics_process(delta):
	if position.y > screensize.y || position.y < 0:
		velocity = Vector2(velocity.x, velocity.y * -1)
	if position.x > screensize.x || position.x < 0:
		velocity = Vector2(velocity.x * -1, velocity.y)
	print(screensize)
	move_and_slide()
	
func _ready():
	screensize = get_viewport_rect().size
	timer.start()

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var randomx = rng.randf_range(-1, 1)
	var randomy = rng.randf_range(-1, 1)
	velocity = Vector2(randomx * 500, randomy * 500)
	timer.start()

func incresescreensize():
	screensize *= 2
