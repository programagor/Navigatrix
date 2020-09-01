extends Node

var ias : float
var tas : float

var pitch : float
var roll : float

var alt : float
var baro : float

var turn : float
var slip : float

var hdg : float

var vs : float

# Called when the node enters the scene tree for the first time.
func _ready():
	ias = 0
	tas = 0

	pitch = 0
	roll = 0
	
	alt = 0
	baro = 29.92
	
	turn = 0
	slip = 0
	
	hdg = 0
	
	vs = 0

func set(key:String,value:float) -> void:
	key=key.substr(31)
	if(key=="altitude_ft_pilot"):
		alt=value
	if(key=="arometer_setting_in_hg_pilot"):
		baro=value
	else: if(key=="heading_vacuum_deg_mag_pilot"):
		hdg=value
	else: if(key=="vvi_fpm_pilot"):
		vs=value
	else: if(key=="airspeed_kts_pilot"):
		ias=value
	else: if(key=="true_airspeed_kts_pilot"):
		tas=value
	else: if(key=="pitch_vacuum_deg_pilot"):
		pitch=value
	else: if(key=="roll_vacuum_deg_pilot"):
		roll=value
	else: if(key=="turn_rate_roll_deg_pilot"):
		turn=value
	else: if(key=="sideslip_degrees"):
		slip=value
	else:
		
		#print(key+"\n"+String(value)+"\n---")
		pass
