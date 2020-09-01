extends Node2D


func _ready():
	pass # Replace with function body.

func _process(_delta):
	
	display_altitude()
	display_pressure()
	
func display_altitude():
	var altitude:float=$"/root/main_view/flight_model".alt
	var disp := altitude * 0.36
	$needle100.rotation_degrees=disp
	$needle1000.rotation_degrees=disp/10
	$needle10000.rotation_degrees=disp/100
	
func display_pressure():
	var baro:float= $"/root/main_view/flight_model".baro
	var disp := -(baro-27.80)*90
	$pressure.rotation_degrees=disp
