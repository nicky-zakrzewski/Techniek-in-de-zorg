extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var task_scene = preload("res://scenes/tasks/task_ticket.tscn")
	
	
	var lengte_taken = TaskDatabase.tasks.size()
	var dikte_taken = ((ProjectSettings.get_setting("display/window/size/viewport_width")/2)/4)/lengte_taken
	var seperator = ((ProjectSettings.get_setting("display/window/size/viewport_width")/2)/4.5)/lengte_taken
	var grootste_taak = Vector2(0, 0)
	var lengte = 0
	for i in range(0, lengte_taken):
		var lengte_cur = TaskDatabase.tasks[i]["naam"].length() * 6 + 30
		if lengte_cur > lengte:
			lengte = lengte_cur
	for i in range(0, lengte_taken):
		var task_instance = task_scene.instantiate()
#		task_instance.position = Vector2(200, 200 * i)
		task_instance.taskname = TaskDatabase.tasks[i]["naam"]
		task_instance.kamer = TaskDatabase.tasks[i]["kamer"]
		task_instance.uur = TaskDatabase.tasks[i]["uur"]
		task_instance.done = TaskDatabase.tasks[i]["gedaan"]
		task_instance.ordernumber = i+1
		task_instance.dikte = dikte_taken
		task_instance.lengte = lengte
		task_instance.font_size = 10
		$MarginContainer/SmallList.add_child(task_instance)
		if(task_instance.custom_minimum_size.x > grootste_taak.x):
			grootste_taak = task_instance.custom_minimum_size
	
	$MarginContainer/SmallList.custom_minimum_size = grootste_taak
	$MarginContainer/SmallList.add_theme_constant_override("separation", seperator)
	
	var margin_value = 20
	$MarginContainer.add_theme_constant_override("margin_top", margin_value)
	$MarginContainer.add_theme_constant_override("margin_right", margin_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
