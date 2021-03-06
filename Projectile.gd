extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var BulletLocaton
var Trajectory = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	BulletLocaton = get_local_mouse_position()
	Trajectory.x = (BulletLocaton.x - $Placeholder.position.x)
	Trajectory.y = (BulletLocaton.y - $Placeholder.position.y)
	
	
#	while Trajectory.y + Trajectory.x > 100:
#		Trajectory.x = Trajectory.x * 0.9
#		Trajectory.y = Trajectory.y * 0.9


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.move_local_x(Trajectory.x /10)
	$Sprite.move_local_y(Trajectory.y /10)
