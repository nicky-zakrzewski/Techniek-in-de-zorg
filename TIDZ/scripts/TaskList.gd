extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var task_scene = preload("res://scenes/tasks/task_ticket.tscn")
	
	var lengte_taken = TaskDatabase.tasks.size()
	var dikte_taken = (ProjectSettings.get_setting("display/window/size/viewport_width")/4)/lengte_taken
	var seperator = (ProjectSettings.get_setting("display/window/size/viewport_width")/4.5)/lengte_taken
	var grootste_taak = Vector2(0, 0)
	var lengte = 0
	for i in range(0, lengte_taken):
		var lengte_cur = TaskDatabase.tasks[i]["naam"].length() * 10 + 20
		if lengte_cur > lengte:
			lengte = lengte_cur
			
	for i in range(0, lengte_taken):
		if(!TaskDatabase.tasks[i]["random"]):
			var task_instance = task_scene.instantiate()
	#		task_instance.position = Vector2(200, 200 * i)
			task_instance.taskname = TaskDatabase.tasks[i]["naam"]
			task_instance.kamer = TaskDatabase.tasks[i]["kamer"]
			task_instance.uur = TaskDatabase.tasks[i]["uur"]
			task_instance.done = TaskDatabase.tasks[i]["gedaan"]
			task_instance.ordernumber = i+1
			task_instance.dikte = dikte_taken
			task_instance.lengte = lengte
			task_instance.font_size = 16
			task_instance.add_to_group("tasks")
			$TaskListVertical.add_child(task_instance)
			if(task_instance.custom_minimum_size.x > grootste_taak.x):
				grootste_taak = task_instance.custom_minimum_size

	var start_button = Button.new()
	start_button.text = "START"
	start_button.connect("pressed", _on_button_pressed)
	$TaskListVertical.add_child(start_button)
	$TaskListVertical.custom_minimum_size = grootste_taak

	#$TaskListVertical.custom_minimum_size = Vector2(10, 42)
	$TaskListVertical.add_theme_constant_override("separation", seperator)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_button_pressed():
	SceneManager.switch_scene("res://scenes/hallway.tscn")
	

