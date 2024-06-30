extends Node2D
var mouseposition
@onready var cursor = $Cursor
var ontarget = false
var score = 0
var iscooldownactive = false
@onready var scoretext = %Score
@onready var camera_2d = $Camera2D
@onready var zoom_timer = $Camera2D/ZoomTimer
var targetzoom

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	mouseposition = get_global_mouse_position()
	cursor.position = mouseposition
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("leftclick") && ontarget == true:
		if iscooldownactive == false:
			score += 1
			print(score)
			scoretext.text = str(score)
			iscooldownactive = true
func _on_area_2d_area_entered(area):
	ontarget = true


func _on_area_2d_area_exited(area):
	ontarget = false
	iscooldownactive = false

func cameraout():
	targetzoom = camera_2d.zoom * 0.5
	zoom_timer.start()
		
func _on_zoom_timer_timeout():	
	if camera_2d.zoom > targetzoom:
		camera_2d.zoom = camera_2d.zoom * 0.9
		zoom_timer.start()
	elif camera_2d.zoom < targetzoom || camera_2d.zoom == targetzoom:
		camera_2d.zoom = targetzoom
