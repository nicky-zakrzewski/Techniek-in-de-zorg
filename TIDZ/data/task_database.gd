extends Node

var tasks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	import_task_file()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_all_events_from_room_without_random(room):
	var tasks_room = []
	for task in tasks:
		if task["kamer"] == room && task["random"] == 0:
			tasks_room.append(task)
			
	return tasks_room
	

func import_task_file():
	var file = FileAccess.open("res://data/tasks.csv", FileAccess.READ)
	var lines = []
	while not file.eof_reached():
		var line = file.get_csv_line(",")
		var detected := []
		for field in line:
			if field.is_valid_int():
				detected.append(int(field))
			else:
				detected.append(field)
		lines.append(detected)
	file.close()
	if not lines.is_empty() and lines.back().size() == 1 and lines.back()[0] == "":
		lines.pop_back()
		
	if lines.is_empty():
			printerr("Can't find header in empty file")
			return ERR_PARSE_ERROR

	var headers = lines[0]
	for i in range(1, lines.size()):
		var fields = lines[i]
		if fields.size() > headers.size():
			printerr("Line %d has more fields than headers" % i)
			return ERR_PARSE_ERROR
		var dict = {}
		for j in headers.size():
			var name = headers[j]
			var value = fields[j] if j < fields.size() else null
			dict[name] = value
		tasks.append(dict)
	
	#print(tasks)

func update_list_of_tasks(origin, target):
	var element_i = tasks[origin-1]
	var element_j = tasks[target-1]
	tasks[origin-1] = element_j
	tasks[target-1] = element_i
