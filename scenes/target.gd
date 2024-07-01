extends CharacterBody2D

var screensize
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var timer = $Timer
@onready var game = $"../.."
@export var level = 0
var currentlevel = 0
var isvisible = true

func _physics_process(delta):
	if isvisible == false && level == currentlevel:
		isvisible = true
		show()
		applymovement()
		timer.start()
	
	if position.y > screensize.y || position.y < 0:
		velocity = Vector2(velocity.x, velocity.y * -1)
	if position.x > screensize.x || position.x < 0:
		velocity = Vector2(velocity.x * -1, velocity.y)
		
	move_and_slide()
func _ready():
	currentlevel = 0
	screensize = get_viewport_rect().size
	if level > currentlevel:
		hide()
		isvisible = false
	else:
		var rng = RandomNumberGenerator.new()
		var randomx = rng.randf_range(-1, 1)
		var randomy = rng.randf_range(-1, 1)
		velocity = Vector2(randomx * 500, randomy * 500)
		timer.start()

func _on_timer_timeout():
	applymovement()

func incresescreensize():
	screensize *= 2
func applymovement():
	var rng = RandomNumberGenerator.new()
	var randomx = rng.randf_range(-1, 1)
	var randomy = rng.randf_range(-1, 1)
	velocity = Vector2(randomx * 500, randomy * 500)
	timer.start()
