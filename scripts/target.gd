extends Node2D
var screensize
@export var timerlength = 0
@onready var timer = $Timer
@export var requiredlevel = 0
func _ready():
	timer.wait_time = timerlength
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screensize = get_viewport_rect().size



func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var randomx = rng.randi_range(0, screensize.x)
	var randomy = rng.randi_range(0, screensize.y)
	position.x = randomx
	position.y = randomy
	timer.start()
