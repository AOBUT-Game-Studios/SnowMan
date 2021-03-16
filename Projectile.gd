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
	
	SelfDestruct()
#	while Trajectory.y + Trajectory.x > 100:
#		Trajectory.x = Trajectory.x * 0.9
#		Trajectory.y = Trajectory.y * 0.9


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.move_local_x(Trajectory.x /10)
	$Sprite.move_local_y(Trajectory.y /10)

func SelfDestruct(): # Take a guess as to what this does
	pass

func _on_Area2D_area_entered(area: Area2D): # makes the node kill itself if it hits something
	queue_free()
	pass # Replace with function body.
