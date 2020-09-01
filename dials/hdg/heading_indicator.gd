extends Node2D

var heading := 0.0

func _ready():
	pass # Replace with function body.

func _process(_delta):
	heading=$"/root/main_view/flight_model".hdg
	display_heading()
	
func display_heading():
	var disp:= -heading
	$heading.rotation_degrees=disp
