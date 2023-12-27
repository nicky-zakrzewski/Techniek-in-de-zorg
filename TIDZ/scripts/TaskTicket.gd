extends Control

var taskname;
var kamer;
var ordernumber;
var uur;
var dropped_on_target = false
var DRAGPREVIEW = preload("res://scenes/tasks/drag_preview.tscn")
var white = Color(1, 1, 1, 1)
var dikte
var lengte
var done
var font_size

# Called when the node enters the scene tree for the first time.
func _ready():


	$OuterContainer/Margin/Row/Order.text = str(ordernumber) + "."
	
	$OuterContainer/Margin/Row/Room.text = str(kamer)
	$OuterContainer/Margin/Row/Order.self_modulate = white
	$OuterContainer/Margin/Row/Taskname.self_modulate = white
	var size_of_tasks = Vector2(lengte, dikte)
	custom_minimum_size = size_of_tasks
	$OuterContainer/Margin/Row.custom_minimum_size = size_of_tasks
	
	$OuterContainer/Margin/Row/Order.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	$OuterContainer/Margin/Row/Taskname.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	$OuterContainer/Margin/Row/Room.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	$OuterContainer/Margin/Row/Order.set("theme_override_font_sizes/font_size", font_size) 
	$OuterContainer/Margin/Row/Taskname.set("theme_override_font_sizes/font_size", font_size) 
	$OuterContainer/Margin/Row/Room.set("theme_override_font_sizes/font_size", font_size) 
	
	if(uur != 0):
		taskname = taskname + " " + str(uur) + ":00"
	
	if(done):
		var line = Line2D.new()
		line.width = 2
		line.add_point(Vector2(5, dikte/2))
		line.add_point(Vector2(custom_minimum_size.x+10, dikte/2))
		add_child(line)
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$OuterContainer/Margin/Row/Taskname.text = taskname
	$OuterContainer/Margin/Row/Room.text = str(kamer)

func _get_drag_data(at_position):
	var slot = get_parent().get_name()
	
	var data = {}
	
	data["origin_node"] = self
	data["origin_slot"] = slot
	
	data["origin_taskname"] = taskname
	data["origin_kamer"] = kamer
	
	var dragpreview = DRAGPREVIEW.instantiate()
	dragpreview.taskname = taskname
	dragpreview.color = white
	dragpreview.position = -0.5 * Vector2(lengte, dikte)
	dragpreview.grootte = Vector2(lengte, dikte)
	
	var c = Control.new()
	c.add_child(dragpreview)
	c.move_child(dragpreview, 0)
	set_drag_preview(c)
	return data
	
func _can_drop_data(at_position, data):
	var target_slot = get_parent().get_name()
	data["target_taskname"] = taskname
	data["target_order"] = ordernumber
	data["target_kamer"] = kamer
	return true


func _drop_data(at_position, data):
	data["origin_node"].taskname = data["target_taskname"]
	data["origin_node"].kamer = data["target_kamer"]
	
	taskname = data["origin_taskname"]
	kamer = data["origin_kamer"]
	TaskDatabase.update_list_of_tasks(data["origin_node"].ordernumber, data["target_order"])
