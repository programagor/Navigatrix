extends Node

var server := UDPServer.new()
var peer : PacketPeerUDP

func _ready():
	start()

func _process(_delta):
	if server.is_connection_available():
		peer = server.take_connection()
		var pkt = peer.get_packet()
		while pkt :
			$"../flight_model".set(
				pkt.subarray(9,64+9).get_string_from_utf8(),
				bin2float(pkt.subarray(5,8))
			)
			pkt = peer.get_packet()
		restart()

func start() -> void:
	if server.listen(49017) != OK:
		push_error("Server not started!")
		get_tree().quit()

func stop():
	if peer:
		peer.close()
	server.stop()

func restart():
	stop()
	start()


func bin2float(pkt:PoolByteArray) -> float:
	var spb = StreamPeerBuffer.new()
	spb.data_array = pkt
	return spb.get_float()
	
