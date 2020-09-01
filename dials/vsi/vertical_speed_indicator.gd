extends Node2D

var vs := 0.0

func _ready():
	pass # Replace with function body.

func _process(_delta):
	vs=$"/root/main_view/flight_model".vs
	display_vs()
	
func display_vs():
	
	var disp := clamp(vs/100,-20,20)/20*(42.5*4)
	$needle.rotation_degrees=disp
	
