extends Panel

var color
var taskname
var white = Color(1, 1, 1)
var grootte : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Taskname.text = taskname
	self_modulate = color
	$Taskname.self_modulate = white
	size = grootte
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
