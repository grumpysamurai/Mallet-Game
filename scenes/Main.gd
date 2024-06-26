extends Node2D
var mouseposition
@onready var cursor = $Cursor

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouseposition = get_global_mouse_position()
	cursor.position = mouseposition
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
