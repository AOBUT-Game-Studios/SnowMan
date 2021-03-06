extends Node2D


# Declare member variables here. Examples:
# var a = 2
var Bl
var trajectory = Vector2()
var rng = RandomNumberGenerator.new()
var rdm1
var rdm2 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	Bl = get_local_mouse_position()
	trajectory.x = (Bl.x - $placeholder.position.x )  
	trajectory.y = (Bl.y - $placeholder.position.y)
	
	rng.randomize()
	rdm1 = rng.randf_range(-1, 1)
	rdm2 = rng.randf_range(-1.1, 1.1)
	
	# Wasn't working earlier, but is muysteriously now
#	while trajectory.x + trajectory.y < 200:
#		trajectory.x = trajectory.x * 1.1
#		trajectory.y = trajectory.y * 1.1
		
	while trajectory.x + trajectory.y > 200:
		trajectory.x = trajectory.x * 0.9
		trajectory.y = trajectory.y * 0.9
	
#	while $bt.position.x < 1000 :
#			trajectory.x = trajectory.x + rdm1
#			trajectory.y = trajectory.y + rdm2
		
#		$bt.move_local_x(trajectory.x)
#		$bt.move_local_y(trajectory.y)
	$bt.position.x = $bt.position.x + (trajectory.x/1.1)
	$bt.position.y = $bt.position.y + (trajectory.y/1.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	rng.randomize()
#	rdm1 = rng.randf_range(-10, 10)
#	rng.randomize()
#	rdm2 = rng.randf_range(-10, 10)
#
#	trajectory.x = trajectory.x + rdm1
#	trajectory.y = trajectory.y + rdm2
	
	$bt.move_local_x(trajectory.x /10 + rdm1)
	$bt.move_local_y(trajectory.y/10  + rdm2)
