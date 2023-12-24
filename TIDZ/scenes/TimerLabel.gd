extends Label



func _process(delta):
	if(Global.timer_on):
		Global.time += delta
		
	var secs = fmod(Global.time,60)
	var mins = fmod(Global.time, 60*60) / 60
	
	var time_passed = "%02d : %02d" % [mins, secs]
	text = time_passed 
	
	
	pass
