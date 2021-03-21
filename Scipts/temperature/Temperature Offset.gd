extends Node2D



# Temperature offset in C° when player enters a specific zone (e.g. campfire). Will be added to Global Temeprature
export(float) var tempOffset


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player Kinematic"):
		get_tree().get_root().get_node("Node2D").get_node("Player").shiftTemperature(2, 2)
		
func _on_Area2D_body_exited(body):
	if(body.get_name() == "Player Kinematic"):
		get_tree().get_root().get_node("Node2D").get_node("Player").shiftTemperature(0, 2)
		
